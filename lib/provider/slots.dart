import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/model/http_exception.dart';
import 'slot.dart';

class Slots with ChangeNotifier {
  List<Slot> item = [];

  String? authtoken;
  String? userId;

  Slots(
    this.authtoken,
    this.userId,
    this.item,
  );

  List<Slot> get items {
    return [...item];
  }

  Slot findBYId(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  List<Slot> get favItems {
    return item.where((element) => element.isFavorite).toList();
  }

  Future<void> fetchData([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="CreatorId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://doctor-ba38d-default-rtdb.firebaseio.com/Slots.json?auth=$authtoken&$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      url = Uri.parse(
          'https://doctor-ba38d-default-rtdb.firebaseio.com/userFav/$userId.json?auth=$authtoken');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<Slot> loadedSlots = [];
      extractedData.forEach((prodId, prodData) {
        loadedSlots.add(Slot(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite:
              favoriteData == null ? false : favoriteData['prodId'] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
      });
      item = loadedSlots;
      print(item.length);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Slot product) async {
    try {
      final url = Uri.parse(
          "https://doctor-ba38d-default-rtdb.firebaseio.com//Slots.json?auth=$authtoken");
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'CreatorId': userId,
          },
        ),
      );
      final newProduct = Slot(
          id: json.decode(response.body)['name'],
          description: product.description,
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price);
      item.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<void> updateProduct(String id, Slot newProduct) async {
    final prodIndex = item.indexWhere((prod) => prod.id == id);

    if (prodIndex >= 0) {
      final url = Uri.parse(
          "https://doctor-ba38d-default-rtdb.firebaseio.com//Slots/$id.json?auth=${authtoken}");

      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      item[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> delProduct(String id) async {
    final url = Uri.parse(
        "https://doctor-ba38d-default-rtdb.firebaseio.com//Slots/$id.json?auth=${authtoken}");

    final index = item.indexWhere((prod) => prod.id == id);
    Slot? existingProduct = item[index];
    item.removeAt(index);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      item.insert(index, existingProduct);
      notifyListeners();
      throw HttpExtentions('colud not delete product');
    }
    existingProduct = null;
    notifyListeners();
  }
}

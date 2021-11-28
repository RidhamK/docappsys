import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/slot.dart';

import '../provider/slots.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'product-detailpge';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedSlots = Provider.of<Slots>(context).findBYId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedSlots.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            margin: const EdgeInsets.all(10),
            child: Hero(
              tag: loadedSlots.id as Object,
              child: Image.network(
                loadedSlots.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${loadedSlots.price}',
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            loadedSlots.description,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

import 'package:docappsys/provider/patient_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/doc_auth.dart';
import '/provider/cart.dart';
import '../provider/slot.dart';

import '../screens/slot_detail_screen.dart';

class SlotItem extends StatelessWidget {
  const SlotItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Slot>(context);
    final cart = Provider.of<Cart>(context);
    final authData = Provider.of<PatientAuth>(context, listen: false);
    return ClipRRect(
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Hero(
            tag: product.id as Object,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: () {
              product.toggeleFav(
                authData.token!,
                authData.userId!,
              );
            },
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id.toString(), product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('add to cart'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeSingleItem(product.id.toString());
                      }),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/slots.dart';
import '/widgets/productitem.dart';

class ProductGrid extends StatelessWidget {
  // const ProductGrid({Key? key}) : super(key: key);

  final bool showFav;

  ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Slots>(context);
    final slots = showFav ? productData.favItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: slots.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: slots[i],
        child: SlotItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}

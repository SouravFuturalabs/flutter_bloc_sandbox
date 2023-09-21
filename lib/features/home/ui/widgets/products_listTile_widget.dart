import 'package:flutter/material.dart';
import 'package:flutter_bloc_sandbox/features/home/models/home_products_model.dart';

class ProductsListTimeWidget extends StatelessWidget {
  final Products products; 
  const ProductsListTimeWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(products.name),
      subtitle: Text(products.price.toString()),
    );
  }
}
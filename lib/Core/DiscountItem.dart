
// ignore_for_file: non_constant_identifier_names

import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:flutter/material.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${product!.discount}% OFF',
        style: AppStyles.text14(context)
            .copyWith(color: Colors.white),
      ),
    );
  }
}

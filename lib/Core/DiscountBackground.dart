
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:flutter/material.dart';

class DiscountBackground extends StatelessWidget {
  const DiscountBackground({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.brand ?? 'Product Name',
            style: AppStyles.text14(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 4),
          Text(
            '\$${product?.price?.toStringAsFixed(2) ?? '0.00'}',
            style:  AppStyles.text14(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            
            
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/DiscountItem.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PopularPlaceHolder.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.PopularProduct,
    required this.isfavourite,
    this.onPressed,
  });

  final Product? PopularProduct;
  final bool isfavourite;
  final void Function()? onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: PopularProduct == null
                    ? const PopularPlaceHolder()
                    : CachedNetworkImage(
                        imageUrl: PopularProduct!.image ??
                            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691073671025-galaxy%20S21%20FE.jpg",
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.20,
                        placeholder: (context, url) {
                          return const PopularPlaceHolder();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                      ),
              ),
              if (PopularProduct?.discount != null &&
                  PopularProduct!.discount! > 0)
                Positioned(
                  top: 8,
                  left: 8,
                  child: DiscountItem(product: PopularProduct),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (PopularProduct?.brand != null)
                  Text(
                    PopularProduct!.brand!,
                    style: AppStyles.text14(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (PopularProduct?.price != null)
                        Text(
                          "${PopularProduct!.price!.toStringAsFixed(2)}\$",
                          style: AppStyles.text14(context).copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      IconButton(
                        onPressed: onPressed,
                        icon: isfavourite
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_border,
                                color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

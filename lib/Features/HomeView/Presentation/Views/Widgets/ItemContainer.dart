import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PlaceHolderContainer.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.product,
  });
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: product == null
              ? const PlaceHolderContainer()
              : CachedNetworkImage(
                  imageUrl: product!.image ??
                      "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692947383286-714WUJlhbLS._SL1500_.jpg",
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    return const PlaceHolderContainer();
                  },
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
        ),
        product == null
            ? const PlaceHolderContainer()
            : Text(
                product!.brand ?? "",
                style: AppStyles.text14(context),
              ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Core/DiscountBackground.dart';
import 'package:ecommerceapp/Core/DiscountItem.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/SpecialPlaceHolder.dart';
import 'package:flutter/material.dart';

class SpecialContainer extends StatelessWidget {
  const SpecialContainer({
    super.key,
    required this.specialproduct,
  });

  final Product? specialproduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            specialproduct == null
                ? const SpecialPlaceHolder()
                : CachedNetworkImage(
                    imageUrl: specialproduct!.image ??
                        "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1694242482686-81V5P1x+LSL._SL1500_.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    placeholder: (context, url) {
                      return const SpecialPlaceHolder();
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
            if (specialproduct?.discount != null &&
                specialproduct!.discount! > 0)
              Positioned(
                top: 8,
                right: 8,
                child: DiscountItem(product: specialproduct),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DiscountBackground(product: specialproduct),
            ),
          ],
        ),
      ),
    );
  }
}

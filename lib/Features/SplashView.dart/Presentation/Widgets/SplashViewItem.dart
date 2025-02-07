import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';

class SplashViewItem extends StatelessWidget {
  const SplashViewItem({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Ecommerce APP",
          style: AppStyles.text20(context),
        ),
        Text(
          title,
          style: AppStyles.text14(context),
        ),
        const SizedBox(
          height: 20,
        ),
        CachedNetworkImage(
          imageUrl: image,
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error,
              color: Colors.red,
            );
          },
        )
      ],
    );
  }
}

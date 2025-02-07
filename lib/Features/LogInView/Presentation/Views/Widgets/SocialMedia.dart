import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: SvgPicture.asset(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

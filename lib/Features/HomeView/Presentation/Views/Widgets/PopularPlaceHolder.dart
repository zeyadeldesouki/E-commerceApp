import 'package:flutter/material.dart';

class PopularPlaceHolder extends StatelessWidget {
  const PopularPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.37,
      height: MediaQuery.of(context).size.height * 0.18,
      color: Colors.grey[300],
    );
  }
}

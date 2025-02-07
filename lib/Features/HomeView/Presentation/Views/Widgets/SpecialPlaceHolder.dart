import 'package:flutter/material.dart';

class SpecialPlaceHolder extends StatelessWidget {
  const SpecialPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.47,
      height: MediaQuery.sizeOf(context).height * 0.13,
      color: Colors.grey[300],
    );
  }
}

import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';

class SurpriseContainer extends StatelessWidget {
  const SurpriseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A Summer Surprise",
              style: AppStyles.text14(context).copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              "Cashback 20%",
              style: AppStyles.text16(context).copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CodeVerifiyContainer extends StatelessWidget {
  const CodeVerifiyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

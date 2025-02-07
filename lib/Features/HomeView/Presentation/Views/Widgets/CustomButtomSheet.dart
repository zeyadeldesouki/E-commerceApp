import 'package:flutter/material.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        child: const Icon(Icons.ac_unit_outlined),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      const Text("Add voucher code"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.backspace_sharp),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text("Total"),
                          Text(r"$300.15"),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          minimumSize:
                              Size(MediaQuery.sizeOf(context).width * 0.45, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Check Out",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/SpecialContainer.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class SpecialContainerListView extends StatelessWidget {
  const SpecialContainerListView(
      {super.key, required this.products, this.loading = false});
  final List<Product> products;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.13,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SpecialContainer(
                specialproduct: loading ? null : products[index],
              ).redacted(
                context: context,
                redact: loading,
                configuration: RedactedConfiguration(
                  redactedColor: Colors.grey.shade300,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

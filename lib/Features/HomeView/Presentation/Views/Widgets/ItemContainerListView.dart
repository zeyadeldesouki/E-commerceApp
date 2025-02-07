import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/ItemContainer.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class ItemContainerListView extends StatelessWidget {
  const ItemContainerListView(
      {super.key, required this.products, this.isloading = false});
  final List<Product> products;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ItemContainer(
                product: isloading ? null : products[index],
              ).redacted(
                context: context,
                redact: isloading,
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

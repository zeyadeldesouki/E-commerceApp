// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PopularItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';

List<Product> favorites = [];

class PopularItemListView extends StatefulWidget {
  const PopularItemListView(
      {super.key, required this.products, this.loading = false});

  final List<Product> products;
  final bool loading;

  @override
  _PopularItemListViewState createState() => _PopularItemListViewState();
}

class _PopularItemListViewState extends State<PopularItemListView> {
  void toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            final isFavorite = favorites.contains(product);

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRoutes.kDetails,
                    extra: product.toJson(),
                  );
                },
                child: PopularItem(
                  PopularProduct: product,
                  isfavourite: isFavorite,
                  onPressed: () => toggleFavorite(product),
                ).redacted(
                  context: context,
                  redact: widget.loading,
                  configuration: RedactedConfiguration(
                    redactedColor: Colors.grey,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

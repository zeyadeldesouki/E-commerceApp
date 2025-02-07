import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({
    super.key, required this.controller, required this.onTap,
  });
  final SearchController controller;
  final VoidCallback onTap; 

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
      elevation: WidgetStateProperty.all(0),
      hintText: "Search for products...",
      hintStyle: WidgetStateProperty.all(
        AppStyles.text14(context).copyWith(color: Colors.grey[600]),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onTap:onTap,
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      leading: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mic,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
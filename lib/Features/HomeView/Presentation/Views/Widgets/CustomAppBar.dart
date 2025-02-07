import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/SearchBarItem.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  static final SearchController _searchController = SearchController();
  static final List<String> searchlist = [
    "laptop",
    "mobile",
    "gaming",
    "headphones",
    "keyboard",
    "mouse",
    "monitor",
    "camera",
    "printer",
    "tablet",
  ];

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: CustomAppBar._searchController,
      viewBackgroundColor: Colors.white,
      viewElevation: 4,
      viewSurfaceTintColor: Colors.transparent,
      viewShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      builder: (context, SearchController controller) {
        return SearchBarItem(
          controller: controller,
          onTap: () {
            controller.openView();
          }
        );
      },
      suggestionsBuilder: (context, SearchController controller) {
        if (controller.value.text.isEmpty) {
          return [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Recent Searches",
                style:
                    AppStyles.text14(context).copyWith(color: Colors.grey[600]),
              ),
            ),
          ];
        }
        final query = controller.value.text.toLowerCase();
        final suggestions = CustomAppBar.searchlist
            .where((item) => item.toLowerCase().contains(query))
            .toList();

        return [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Suggestions",
              style:
                  AppStyles.text14(context).copyWith(color: Colors.grey[600]),
            ),
          ),
          ...suggestions.map((item) {
            return ListTile(
              title: Text(
                item,
                style:
                    AppStyles.text14(context).copyWith(color: Colors.grey[600]),
              ),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          }),
        ];
      },
    );
  }
}



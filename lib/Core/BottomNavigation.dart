import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
  });
  static int currentindex = 0;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Colors.indigo,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      buttonBackgroundColor: Colors.indigo.shade800,
      index: BottomNavigation.currentindex,
      onTap: (value) {
        setState(() {
          BottomNavigation.currentindex = value;
        });

        if (value == 1) {
          GoRouter.of(context).push(AppRoutes.kFavorite);
        } else if (value == 2) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            confirmBtnText: "Yes",
            text: "Are you want to logout?",
            title: "Confirm Logout",
            cancelBtnText: "No",
            showCancelBtn: true,
            onCancelBtnTap: () {
              return GoRouter.of(context).pop();
            },
            onConfirmBtnTap: () {
              GoRouter.of(context).push(AppRoutes.kLogin);
              BottomNavigation.currentindex = 0;
            },
          );
        }
      },
      items: const [
        ItemList(
          title: "Home",
          iconData: Icons.home_outlined,
        ),
        ItemList(
          title: "Favorite",
          iconData: Icons.favorite_border_outlined,
        ),
        ItemList(
          title: "Logout",
          iconData: Icons.logout_outlined,
        ),

          
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key, required this.iconData, required this.title,
  });

  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        Text(
          title,
          style: AppStyles.text14(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

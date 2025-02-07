import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PopularItemListView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favorites",
          style: AppStyles.text14(context),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!",
                style: AppStyles.text14(context),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CachedNetworkImage(
                          imageUrl: product.image ??
                              "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691073671025-galaxy%20S21%20FE.jpg",
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        )),
                  ),
                  title: Text(
                    product.brand ?? "",
                    style: AppStyles.text14(context),
                  ),
                  subtitle: Text(
                    "${product.price.toString()}\$",
                    style: AppStyles.text14(context),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: "Are you sure you want to delete this item?",
                          confirmBtnText: "OK",
                          showCancelBtn: true,
                          onCancelBtnTap: () {
                            GoRouter.of(context).pop();
                          },
                          onConfirmBtnTap: () {
                            setState(() {
                              favorites.remove(product);                              
                            });
                            GoRouter.of(context).pop();
                          });
                    },
                  ),
                );
              },
            ),
    );
  }
}

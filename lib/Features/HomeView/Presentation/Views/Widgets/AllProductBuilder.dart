import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/AllProduct/all_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/ItemContainerListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductBuilder extends StatelessWidget {
  const AllProductBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        if (state is AllProductSucess) {
          return ItemContainerListView(
            products: state.products,
            isloading: false,
          );
        } else if (state is AllProductFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const ItemContainerListView(
            products: [],
            isloading: true,
          );
        }
      },
    );
  }
}

import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/PopularProduct/popular_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/PopularItemListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularProductBuilder extends StatelessWidget {
  const PopularProductBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularProductCubit, PopularProductState>(
      builder: (context, state) {
        if (state is PopularProductSucess) {
          return PopularItemListView(
            products: state.products,
            loading: false,
          );
        } else if (state is PopularProductFailure) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errorMessage)));
        } else {
          return const PopularItemListView(
            products: [],
            loading: true,
          );
        }
      },
    );
  }
}

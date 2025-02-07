import 'package:ecommerceapp/Features/HomeView/Presentation/Manager/SpecialProduct/special_product_cubit.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/SpecialContainerListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialProductBuilder extends StatelessWidget {
  const SpecialProductBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialProductCubit, SpecialProductState>(
      builder: (context, state) {
        if (state is SpecialProductSucess) {
          return SpecialContainerListView(
            products: state.products,
            loading: false,
          );
        } else if (state is SpecialProductFailure) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errorMessage)));
        } else {
          return const SpecialContainerListView(
            products: [],
            loading: true,
          );
        }
      },
    );
  }
}

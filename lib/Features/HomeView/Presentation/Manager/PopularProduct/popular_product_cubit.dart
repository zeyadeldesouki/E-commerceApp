// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/HomeRepoImplement.dart';
import 'package:meta/meta.dart';

part 'popular_product_state.dart';

class PopularProductCubit extends Cubit<PopularProductState> {
  final HomeRepoImplement homeRepoImplement;
  PopularProductCubit(this.homeRepoImplement) : super(PopularProductInitial());
  Future<void> getPopularProducts() async {
    emit(
      PopularProductLoaded(),
    );
    var result = await homeRepoImplement.GetPopularProducts();
    result.fold(
      (Failure) {
        emit(
          PopularProductFailure(errorMessage: Failure.err),
        );
      },
      (Products) {
        emit(
          PopularProductSucess(products: Products),
        );
      },
    );
  }
}

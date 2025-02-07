// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/HomeRepoImplement.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  final HomeRepoImplement homeRepoImplement;
  AllProductCubit(this.homeRepoImplement) : super(AllProductInitial());
  Future<void> getAllProducts() async {
    emit(AllProductLoaded());
    var result = await homeRepoImplement.GetAllProducts();
    result.fold(
      (Failure) {
        emit(
          AllProductFailure(errorMessage: Failure.err),
        );
      },
      (products) {
        emit(
          AllProductSucess(products: products),
        );
      },
    );
  }
}

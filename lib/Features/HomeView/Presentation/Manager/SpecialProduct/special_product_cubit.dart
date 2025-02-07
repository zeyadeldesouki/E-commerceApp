// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/HomeRepoImplement.dart';
import 'package:meta/meta.dart';

part 'special_product_state.dart';

class SpecialProductCubit extends Cubit<SpecialProductState> {
  final HomeRepoImplement homeRepoImplement;
  SpecialProductCubit(this.homeRepoImplement) : super(SpecialProductInitial());
  Future<void> getspecialProducts() async {
    emit(SpecialProductLoaded());
    var result = await homeRepoImplement.GetSpecialProducts();
    result.fold(
      (Failure) {
        emit(
          SpecialProductFailure(errorMessage: Failure.err),
        );
      },
      (Products) {
        emit(
          SpecialProductSucess(products: Products),
        );
      },
    );
  }
}

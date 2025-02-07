part of 'all_product_cubit.dart';

@immutable
sealed class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductLoaded extends AllProductState {}

final class AllProductSucess extends AllProductState {
  final List<Product> products;

  AllProductSucess({required this.products});
}

final class AllProductFailure extends AllProductState {
  final String errorMessage;

  AllProductFailure({required this.errorMessage});
}

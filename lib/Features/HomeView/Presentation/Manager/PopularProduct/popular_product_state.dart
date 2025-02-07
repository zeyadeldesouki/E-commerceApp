part of 'popular_product_cubit.dart';

@immutable
sealed class PopularProductState {}

final class PopularProductInitial extends PopularProductState {}

final class PopularProductLoaded extends PopularProductState {}

final class PopularProductSucess extends PopularProductState {
  final List<Product> products;

  PopularProductSucess({required this.products});
}

final class PopularProductFailure extends PopularProductState {
  final String errorMessage;

  PopularProductFailure({required this.errorMessage});
}

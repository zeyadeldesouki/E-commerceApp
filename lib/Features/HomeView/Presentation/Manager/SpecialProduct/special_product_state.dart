part of 'special_product_cubit.dart';

@immutable
sealed class SpecialProductState {}

final class SpecialProductInitial extends SpecialProductState {}

final class SpecialProductLoaded extends SpecialProductState {}

final class SpecialProductSucess extends SpecialProductState {
  final List<Product> products;

  SpecialProductSucess({required this.products});
}

final class SpecialProductFailure extends SpecialProductState {
  final String errorMessage;

  SpecialProductFailure({required this.errorMessage});
}

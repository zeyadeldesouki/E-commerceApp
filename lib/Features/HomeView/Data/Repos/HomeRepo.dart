// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Core/Failure.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Product>>> GetAllProducts();
  Future<Either<Failure, List<Product>>> GetSpecialProducts();
  Future<Either<Failure, List<Product>>> GetPopularProducts();
}

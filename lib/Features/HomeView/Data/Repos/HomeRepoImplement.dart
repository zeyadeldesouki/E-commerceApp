// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/Core/ApiService.dart';
import 'package:ecommerceapp/Core/Failure.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Models/item_model/product.dart';
import 'package:ecommerceapp/Features/HomeView/Data/Repos/HomeRepo.dart';

class HomeRepoImplement extends HomeRepo {
  final ApiService apiService;
  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> GetAllProducts() async {
    try {
      var data = await apiService.Get(endpoint: "products");
      List<Product> products = [];
      for (var element in data['products']) {
        products.add(
          Product.fromJson(element),
        );
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(
          Serverfailure.fromDio(e),
        );
      } else {
        return left(
          Serverfailure(
            err: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> GetPopularProducts() async {
    try {
      var data =
          await apiService.Get(endpoint: "products/category?type=mobile");
      List<Product> products = [];
      for (var element in data['products']) {
        products.add(
          Product.fromJson(element),
        );
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(
          Serverfailure.fromDio(e),
        );
      } else {
        return left(
          Serverfailure(
            err: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> GetSpecialProducts() async {
    try {
      var data =
          await apiService.Get(endpoint: "products/category?type=laptop");
      List<Product> Products = [];
      for (var element in data['products']) {
        Products.add(
          Product.fromJson(element),
        );
      }
      return right(Products);
    } catch (e) {
      if (e is DioException) {
        return left(
          Serverfailure.fromDio(e),
        );
      } else {
        return left(
          Serverfailure(
            err: e.toString(),
          ),
        );
      }
    }
  }
}

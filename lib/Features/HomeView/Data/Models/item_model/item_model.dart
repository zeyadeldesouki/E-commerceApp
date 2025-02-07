import 'product.dart';

class ItemModel {
  String? status;
  String? message;
  List<Product>? products;

  ItemModel({this.status, this.message, this.products});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}

class Product {
  int? id;
  String? title;
  String? image;
  int? price;
  String? description;
  String? brand;
  String? model;
  String? color;
  String? category;
  int? discount;
  bool? popular;
  bool? onSale;

  Product({
    this.id,
    this.title,
    this.image,
    this.price,
    this.description,
    this.brand,
    this.model,
    this.color,
    this.category,
    this.discount,
    this.popular,
    this.onSale,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        color: json['color'] as String?,
        category: json['category'] as String?,
        discount: json['discount'] as int?,
        popular: json['popular'] as bool?,
        onSale: json['onSale'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
        'description': description,
        'brand': brand,
        'model': model,
        'color': color,
        'category': category,
        'discount': discount,
        'popular': popular,
        'onSale': onSale,
      };
}

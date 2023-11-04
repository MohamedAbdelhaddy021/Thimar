class ProductDetailsData {
  late final ProductModel model;

  ProductDetailsData.fromJson(Map<String, dynamic> json) {
    model = ProductModel.fromJson(json['data']);
  }
}

class ProductModel {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final int priceBeforeDiscount;
  late final num price;
  late final double discount;
  late final num amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<dynamic> images;
  late final String mainImage;
  late final String createdAt;

  ProductModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    priceBeforeDiscount = json['price_before_discount'];
    price = json['price'];
    discount = json['discount'];
    amount = json['amount'];
    isActive = json['is_active'];
    isFavorite = json['is_favorite'];
    unit = Unit.fromJson(json['unit']);
    images = List.castFrom<dynamic, dynamic>(json['images']);
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }
}

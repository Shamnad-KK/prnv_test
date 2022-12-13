class ProductModel {
  final String name;
  final double price;
  final String image;
  final int categoryId;
  int quantity;
  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
    this.quantity = 1,
  });
}

class CategoryModel {
  final int id;
  final String name;
  final String image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

class ProductModal {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String imaage;
  final String category;

  ProductModal(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imaage,
      required this.category});

  factory ProductModal.fromJson(jsonData) {
    return ProductModal(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        imaage: jsonData['image'],
        category: jsonData['category']);
  }
}

class RatingModal {
  final dynamic rate;
  final double count;

  RatingModal({required this.rate, required this.count});

  factory RatingModal.fromJson(jsonData) {
    return RatingModal(rate: jsonData['rate'], count: jsonData['count']);
  }
}

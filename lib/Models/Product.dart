// ignore_for_file: file_names

class ProductCart {
  final String uidProduct;
  final String image;
  final String name;
  double price;
  int amount;

  ProductCart({
    required this.uidProduct,
    required this.image,
    required this.name,
    required this.price,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'uidProduct': uidProduct,
      'price': price,
      'amount': amount,
      'image': image,
      'name': name
    };
  }
}

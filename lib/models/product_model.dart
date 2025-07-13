class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'category': category,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      category: map['category'],
      quantity: map['quantity'] ?? 1,
    );
  }
}

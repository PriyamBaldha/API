class Product{
  final int id;
  final String image;
  final String title;
  final String description;
  final double price;
  // final double rate;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    // required this.rate
});
  
  factory Product.fromJSON({required Map<String, dynamic> json}) {
    return Product(id:json['id'],image: json['image'], title: json['title'], description: json['description'],price: json['price'], );
  }
}

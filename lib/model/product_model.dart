class Product{
  final String name;
  final String price;
  final String desc;

  Product(this.name, this.price, this.desc);
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['price'],
      json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'desc': desc,
    };
  }
}
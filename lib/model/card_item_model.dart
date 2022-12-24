class CartItemModel {
  String? name;
  String? image;
  String? price;
  int? quantity;
  String? id;

  CartItemModel({this.name, this.image, this.price, this.quantity , this.id});

  CartItemModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    id = json['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'id': id,
    };
  }
}
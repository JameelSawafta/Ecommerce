class CategorieModel{
  String? name;
  String? image;
  String? price;
  String? disc;
  String? type;
  String? id;

  CategorieModel({this.name, this.image, this.price, this.disc, this.type , this.id});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    disc = json['disc'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['disc'] = this.disc;
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
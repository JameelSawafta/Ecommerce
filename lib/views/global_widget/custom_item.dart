import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItem extends StatelessWidget {

  String? name;
  String? link;
  String? price;
  String? description;
  String? id;

  CustomItem({this.name, this.link, this.price , this.description , this.id});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/item', arguments: {
          'name': name,
          'link': link,
          'price': price,
          'description': description,
          'id': id,
        });
      },
      child: Container(
        child: Column(
          children: [
            Image.network(
              '$link',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              '$name',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF272833),
              ),
               textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              '$price',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF272833),
              ),
                textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GoogleOrFacebook extends StatelessWidget {

  Color? _color;
  String? _text;
  String? _image;
  Function()? _onPressed;
  GoogleOrFacebook({required Color color, required String text, required String image, required Function()? onPressed}){
    _color = color;
    _text = text;
    _image = image;
    _onPressed = onPressed;
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onPressed!();
      },
      child: Container(
          width: 240,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: _color!,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset('$_image',color: _color,),
              SizedBox(
                width: 20,
              ),
              Text('$_text', style: TextStyle(fontSize: 15, color: _color),),
            ],
          )
      ),
    );
  }
}

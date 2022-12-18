import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  double? _width;
  double? _height;
  String? _text;
  Function()? _onPressed;

  CustomButton({required double width, required double height, required String text , required Function()? onPressed}) {
    _width = width;
    _height = height;
    _text = text;
    _onPressed = onPressed;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text('${_text}', style: TextStyle(fontSize: 15)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffCC9D76),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}

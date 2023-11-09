import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name;
  String imagePath;
  CategoryItem({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(imagePath, width: double.infinity , fit: BoxFit.fill,height: double.infinity),
        Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),)
      ],
    );
  }
}

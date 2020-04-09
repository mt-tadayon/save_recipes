import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final String imageUrl;
  final String name;

  RecipeScreen({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: AssetImage(imageUrl),
          ),
        ],
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final File imageFile;
  final String name;

  RecipeScreen({this.imageFile, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: FileImage(imageFile, scale: 1.0),
          ),
        ],
      ),
    );
  }
}

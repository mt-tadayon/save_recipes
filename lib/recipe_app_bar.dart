import 'package:flutter/material.dart';

class RecipeAppBar extends AppBar {
  final Icon icon;
  final Function onTap;

  RecipeAppBar({this.icon, this.onTap})
      : super(backgroundColor: Colors.white, actions: <Widget>[
          IconButton(
            icon: icon,
            onPressed: onTap,
            color: Colors.grey,
          ),
        ]);
}

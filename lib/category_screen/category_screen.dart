import 'package:flutter/material.dart';
import 'package:saverecipes/recipe_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  CategoryScreen(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        icon: Icon(Icons.home),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: <Widget>[Text(categoryName)],
      ),
    );
  }
}

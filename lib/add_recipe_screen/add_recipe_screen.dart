import 'package:flutter/material.dart';
import 'package:saverecipes/recipe_app_bar.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        icon: Icon(Icons.home),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Add New Recipe',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Give a name to your recipe',
              ),
              controller: _controller,
              onSubmitted: (value) {print(value);},
            )
          ],
        ),
      ),
    );
  }
}

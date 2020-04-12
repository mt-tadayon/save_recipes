import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saverecipes/add_recipe_screen/add_recipe_screen.dart';
import 'package:saverecipes/models/recipe_model.dart';
import 'package:saverecipes/recipe_screen/recipe_screen.dart';
import 'package:saverecipes/services/recipe_service.dart';

final RecipeService _recipeService = RecipeService();

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  CategoryScreen(this.categoryName);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<RecipeModel> recipes = [];

  Future<void> getRecipes() async {
    recipes = await _recipeService.getAllRecipes();
    setState(() {});
  }

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddRecipeScreen()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              widget.categoryName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(recipes[index].recipeName),
                              leading: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(recipes[index].photoUrl),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      print(
                                          recipes[index].photoUrl);
                                      return RecipeScreen(
                                        name: recipes[index].recipeName,
                                        imageFile: File(
                                            recipes[index].photoUrl),
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saverecipes/feature/add_recipe_screen/add_recipe_screen.dart';
import 'package:saverecipes/feature/recipe_screen/recipe_screen.dart';
import 'package:saverecipes/layer/models/recipe_model.dart';
import 'package:saverecipes/main.dart';

const recipeBox = 'recipeBox';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  CategoryScreen(this.categoryName);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Box<RecipeModel> recipeBox;

  @override
  void initState() {
    recipeBox = Hive.box<RecipeModel>(recipeBoxName);
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
              child: ValueListenableBuilder(
                valueListenable: recipeBox.listenable(),
                builder: (_, box, __) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(box[index].recipeName),
                              leading: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  image: AssetImage(box[index].recipeImageUrl),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      print(box[index].recipeImageUrl);
                                      return RecipeScreen(
                                        name: box[index].recipeName,
                                        imageFile:
                                            File(box[index].recipeImageUrl),
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

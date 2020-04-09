import 'package:flutter/material.dart';
import 'package:saverecipes/models/recipe_model.dart';
import 'package:saverecipes/recipe_app_bar.dart';

final RecipeHelper _recipeHelper = RecipeHelper();

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  CategoryScreen(this.categoryName);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<RecipeModel> recipes = [];

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
              widget.categoryName,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              onPressed: () async {
                List<RecipeModel> list = await _recipeHelper.getAllRecipes();

                setState(() {
                  recipes = list;
                });
              },
              child: Text('Get recipes'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) =>
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(recipes[index].photoUrl),
                                  fit: BoxFit.cover)),
                          child: Text(recipes[index].recipeName),
                        )
                      ],
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

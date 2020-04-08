import 'package:flutter/material.dart';
import 'package:saverecipes/add_recipe_screen/add_recipe_screen.dart';
import 'package:saverecipes/home_screen/category_card.dart';
import 'package:saverecipes/home_screen/last_recipe_card.dart';
import 'package:saverecipes/recipe_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(
        icon: Icon(Icons.add_circle),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecipeScreen(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'My Recipes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            LastRecipeCard(),
            SizedBox(
              height: 20.0,
            ),
            Text('Quick Recipies'),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryCard(
                    color: Colors.amber,
                    categoryName: 'Noodel',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CategoryCard(
                    color: Colors.deepOrange,
                    categoryName: 'Rice',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

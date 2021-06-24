import 'package:flutter/material.dart';
import 'package:saverecipes/feature/add_recipe_screen/add_recipe_screen.dart';
import 'package:saverecipes/feature/category_screen/category_screen.dart';
import 'package:saverecipes/feature/home_screen/last_recipe_card.dart';
import 'package:saverecipes/layer/data/category_data.dart';

import 'category_card.dart';

class HomeScreen extends StatelessWidget {
  final noodleString = CategoryName.noodel.getCategoryString();
  final riceString = CategoryName.rice.getCategoryString();
  final chickenString = CategoryName.chicken.getCategoryString();
  final beefString = CategoryName.beef.getCategoryString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            tooltip: 'Add new Recipe',
            icon: Icon(
              Icons.add_circle,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddRecipeScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
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
              height: 10.0,
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
                    categoryName: noodleString,
                    categoryScreen: CategoryScreen(noodleString),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CategoryCard(
                    color: Colors.deepOrange,
                    categoryName: riceString,
                    categoryScreen: CategoryScreen(riceString),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CategoryCard(
                    color: Colors.lightBlue,
                    categoryName: chickenString,
                    categoryScreen: CategoryScreen(chickenString),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CategoryCard(
                    color: Colors.teal,
                    categoryName: beefString,
                    categoryScreen: CategoryScreen(beefString),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

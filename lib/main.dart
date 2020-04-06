import 'package:flutter/material.dart';
import 'package:saverecipes/category_card.dart';
import 'package:saverecipes/last_recipe_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Recipies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(Icons.home),
              color: Colors.grey,
              onPressed: () {
                print('Hello Wordl!');
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle),
              color: Colors.grey,
              onPressed: () {
                print('add recipie');
              },
            )
          ],
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
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () {
                      print('Hello World');
                    },
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
                    CategoryCard(color: Colors.amber, categoryName: 'Noodel',),
                    SizedBox(width: 20.0,),
                    CategoryCard(color: Colors.deepOrange, categoryName: 'Rice',)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

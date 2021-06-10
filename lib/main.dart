import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saverecipes/layer/models/category_model.dart';
import 'package:saverecipes/layer/models/recipe_model.dart';

import 'feature/home_screen/home_screen.dart';

const recipeBoxName = 'recipeBoxName';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<RecipeModel>(recipeBoxName);
  Hive.registerAdapter(RecipeModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Recipies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saverecipes/layer/data/service/hive_db.dart';
import 'package:saverecipes/layer/models/recipe_model.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final HiveDB _db = HiveDB();
  RecipeModel currentRecipe = RecipeModel();
  final _controller = TextEditingController();
  File _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    currentRecipe.recipeImageUrl = image.path;
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
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
        child: ListView(
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
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: _image == null
                    ? Text('No image is selected')
                    : Image.file(_image),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Select your recipe\'s image',
                  style: TextStyle(fontSize: 16.0),
                ),
                IconButton(
                  color: Colors.grey,
                  icon: Icon(Icons.camera_alt),
                  onPressed: getImage,
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Save Recipe'),
              onPressed: () {
                currentRecipe.recipeName = _controller.text;
                _db.addRecipe(currentRecipe);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

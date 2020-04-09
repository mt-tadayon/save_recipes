import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saverecipes/models/recipe_model.dart';

RecipeModel currentRecipe = RecipeModel();
final RecipeHelper _recipeHelper = RecipeHelper();
final _controller = TextEditingController();
File _image;

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    currentRecipe.photoUrl = image.path;

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
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
            RaisedButton(
              child: Text('Save Recipe'),
              onPressed: () {
                currentRecipe.recipeName = _controller.text;
                _recipeHelper.insertRecipe(currentRecipe);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

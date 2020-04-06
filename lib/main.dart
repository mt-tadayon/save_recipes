import 'package:flutter/material.dart';

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
          title: Text(
            'Cooking Recipie',
            style: TextStyle(color: Colors.black),
          ),
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
      ),
    );
  }
}

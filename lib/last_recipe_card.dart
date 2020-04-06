import 'package:flutter/material.dart';

class LastRecipeCard extends StatelessWidget {
  const LastRecipeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'EGG FRY',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: <Widget>[
                Text(
                  '10 min',
                  style: TextStyle(color: Colors.white),
                ),
                Divider(
                  color: Colors.red,
                  thickness: 10.0,
                  height: 20.0,
                ),
                Text(
                  'Category',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LastRecipeCard extends StatelessWidget {
  const LastRecipeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'EGG FRY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Text(
                  '10 min',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Container(
                    height: 10.0,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 2.0,
                    )),
                Text(
                  'Category',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

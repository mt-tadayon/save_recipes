import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final Color color;
  const CategoryCard({
    Key key,
    this.categoryName,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment(-0.75, 0.0),
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 2,
          decoration: (BoxDecoration(
            color: color ?? Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          )),
          child: Text(
            categoryName ?? '10',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          ),
        )
      ],
    );
  }
}

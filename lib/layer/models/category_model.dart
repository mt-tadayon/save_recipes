import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveType(typeId: 0)
  String categoryName;

  @HiveType(typeId: 1)
  Color categoryColor;

  @HiveType(typeId: 2)
  Image categoryImage;

  CategoryModel({this.categoryName, this.categoryColor, this.categoryImage});

  Map<String, dynamic> toMap() {
    return {
      'CategoryName': categoryName,
      'categoryColor': categoryColor,
      'categoryImage': categoryImage,
    };
  }
}

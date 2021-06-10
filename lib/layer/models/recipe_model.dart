import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject {
  @HiveField(0)
  int recipeId;

  @HiveField(1)
  String recipeName;

  @HiveField(2)
  String recipeImageUrl;

  RecipeModel({this.recipeId, this.recipeName, this.recipeImageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': this.recipeName,
      'photoUrl': this.recipeImageUrl,
    };
  }
}

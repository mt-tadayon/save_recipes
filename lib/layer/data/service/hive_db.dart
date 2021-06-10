import 'package:hive/hive.dart';
import 'package:saverecipes/layer/models/recipe_model.dart';
import 'package:saverecipes/main.dart';

class HiveDB {
  var box = Hive.box<RecipeModel>(recipeBoxName);

  Future<void> addRecipe(RecipeModel recipeModel) async {
    await box.put('recipe', recipeModel);
  }

  RecipeModel getRecipe() {
    print('>>> ${box.values.first.recipeName}');
    return box.get('recipe');
  }
}

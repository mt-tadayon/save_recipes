class RecipeModel {
  int recipeId;
  String recipeName;
  String photoUrl;

  RecipeModel({this.recipeId, this.recipeName, this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': this.recipeName,
      'photoUrl': this.photoUrl,
    };
  }
}
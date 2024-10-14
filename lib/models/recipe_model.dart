class RecipeModel {
  final String recipeTitle;
  final String recipeSubTitle;
  final String image;
  final String userId;
  final String userName;
  final List<String> ingredients;

  RecipeModel(
      {required this.recipeTitle,
      required this.recipeSubTitle,
      required this.image,
      required this.userId,
      required this.userName,
      required this.ingredients});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      recipeTitle: json['recipeTitle'],
      recipeSubTitle: json['recipeSubTitle'],
      image: json['image'],
      userId: json['userId'],
      userName: json['userName'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'recipeTitle': recipeTitle,
      'recipeSubTitle': recipeSubTitle,
      'image': image,
      'userId': userId,
      'userName': userName,
      'ingredients': ingredients,
    };
  }
}

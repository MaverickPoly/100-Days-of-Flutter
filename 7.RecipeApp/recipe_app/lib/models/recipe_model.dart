class Recipe {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> cookingSteps;

  Recipe(
      {required this.name, required this.description, required this.imageUrl, required this.cookingSteps});
}

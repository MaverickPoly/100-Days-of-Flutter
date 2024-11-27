import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:recipe_app/models/recipe_model.dart";
import "package:recipe_app/models/user_recipes.dart";


class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRecipes>(
      builder: (BuildContext context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          actions: [
            IconButton(
                onPressed: () => value.addFavRecipe(recipe),
                icon: value.userFav.contains(recipe) ?
                  Icon(Icons.bookmark, color: Colors.green.shade700,) :
                  Icon(Icons.bookmark_border, color: Colors.green.shade700))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity, height: 300, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.network(recipe.imageUrl)
                ),
                const SizedBox(height: 16),
                Text(recipe.name, textAlign: TextAlign.start, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20),
                Text(recipe.description, style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipe.cookingSteps.length,
                    itemBuilder: (context, index) {
                      final String current = recipe.cookingSteps[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade50),
                        child: ListTile(
                            title: Text(current)
                        ),
                      );
                    })
            ],),
          ),
        ),
      ),
    );
  }
}

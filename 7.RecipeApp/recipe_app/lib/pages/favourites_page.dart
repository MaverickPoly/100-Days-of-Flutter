import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:recipe_app/models/recipe_model.dart";
import "package:recipe_app/models/user_recipes.dart";
import "package:recipe_app/pages/recipe_details_page.dart";

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRecipes>(
      builder: (context, value, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8,),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text("Your favourites cart", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.green),),
                  ],
                ),
              ),
              Expanded(
                  child: value.userFav.isNotEmpty ? ListView.builder(
                    itemCount: value.userFav.length,
                      itemBuilder: (BuildContext context, int index) {
                        Recipe currentRecipe = value.userFav[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                      child: Image.network(currentRecipe.imageUrl, width: 100, height: 100)
                                  ),
                                  const SizedBox(width: 10),
                                  Text(currentRecipe.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_right_alt),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: currentRecipe))
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        );
                      })  :
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.no_food, size: 60),
                            SizedBox(height: 16),
                            Text("You do not have any favourite recipes yet!", style: TextStyle(fontSize: 20),)
                          ],
                        ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

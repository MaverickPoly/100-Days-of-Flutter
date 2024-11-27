import "package:flutter/material.dart";
import "package:recipe_app/models/recipe_model.dart";
import "package:recipe_app/pages/recipe_details_page.dart";

class RecipeCard extends StatelessWidget {
  final Recipe currentRecipe;
  final void Function()? onFavMarked;
  final List<Recipe> userFav;
  const RecipeCard(
      {super.key,
      required this.currentRecipe,
      required this.onFavMarked,
      required this.userFav});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: currentRecipe)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(14)),
        width: 250,
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: NetworkImage(currentRecipe.imageUrl),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onFavMarked,
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                      onPressed: onFavMarked,
                      icon: Icon(
                        userFav.contains(currentRecipe) ? Icons.bookmark : Icons.bookmark_outline,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    currentRecipe.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentRecipe.description,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:recipe_app/components/bottom_sheet.dart";
import "package:recipe_app/models/recipe_model.dart";
import "package:recipe_app/models/user_recipes.dart";

import "../components/recipe_card.dart";


class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  void favRecipe(Recipe recipe, BuildContext context) {
    Provider.of<UserRecipes>(context, listen: false).addFavRecipe(recipe);
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
              return const MyBottomSheet();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRecipes>(
      builder: (BuildContext context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.grey.shade400),
                                    prefixIcon: const Icon(Icons.search),
                                    prefixIconColor: Colors.grey.shade500,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent, width: 0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent, width: 0))
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: showBottomSheet,
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.sort,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeCategoryItem("Special", Icon(Icons.bakery_dining_outlined, color: Colors.grey.shade300,)),
                          makeCategoryItem("Breakfast", Icon(Icons.egg, color: Colors.grey.shade300,)),
                          makeCategoryItem("Lunch", Icon(Icons.soup_kitchen, color: Colors.grey.shade300,)),
                          makeCategoryItem(
                              "Dinner", Icon(Icons.dinner_dining, color: Colors.grey.shade300,)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NEED TO TRY",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              letterSpacing: 2,
                              color: Colors.green.shade800),
                        ),
                        Row(
                          children: [
                            Text(
                              "See all",
                              style: TextStyle(
                                  color: Colors.blue.shade700, fontSize: 14),
                            ),
                            const SizedBox(width: 3),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.blue.shade700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 380,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.getRecipeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Recipe currentRecipe = value.getRecipeList[index];
                          return RecipeCard(
                            currentRecipe: currentRecipe,
                            onFavMarked: () => favRecipe(currentRecipe, context),
                            userFav: value.userFav,
                          );
                        },
                      ),
                    )
                  ],
                ),
          ),
        ),
      ),
    );
  }

  Widget makeCategoryItem(String title, Icon icon) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            icon,
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}

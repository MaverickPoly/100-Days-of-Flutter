import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';


class UserRecipes extends ChangeNotifier {
  List<Recipe> recipes = [
    Recipe(
      name: "Morning Pancakes",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl:
      "https://images.unsplash.com/photo-1497445702960-c21c96af4c68?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      cookingSteps: [
        "1. In a large bowl, whisk together the flour, sugar, baking powder, baking soda, and salt.",
        "2. In a separate bowl, mix the milk, egg, and melted butter.",
        "3. Pour the wet ingredients into the dry ingredients and stir until just combined.",
        "4. Heat a non-stick skillet over medium heat and lightly grease it with butter.",
        "5. Pour 1/4 cup of batter onto the skillet for each pancake and cook until bubbles form.",
        "6. Flip and cook the other side until golden brown.",
        "7. Serve hot with syrup, fruit, or powdered sugar."
      ],
    ),
    Recipe(
      name: "Omelette",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl:
      "https://images.unsplash.com/photo-1668283653825-37b80f055b05?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      cookingSteps: [
        "1. Crack the eggs into a bowl and whisk with milk or water. Add salt and pepper.",
        "2. Heat a non-stick pan over medium heat with butter or oil.",
        "3. Pour the egg mixture into the pan and swirl to coat the surface.",
        "4. Sprinkle vegetables, cheese, or other fillings over one side of the omelette.",
        "5. Cook until the eggs are set but slightly soft on top.",
        "6. Fold the omelette in half using a spatula.",
        "7. Slide onto a plate and serve immediately."
      ],
    ),
    Recipe(
      name: "Chicken Curls",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl:
      "https://images.unsplash.com/photo-1588923930957-81c81fd6262b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      cookingSteps: [
        "1. Marinate the chicken strips in buttermilk for 30 minutes to 1 hour.",
        "2. In a bowl, mix flour, paprika, garlic powder, onion powder, salt, and pepper.",
        "3. Coat the chicken strips in the flour mixture, shaking off excess.",
        "4. Heat oil in a frying pan to 180°C (350°F).",
        "5. Fry the chicken in batches until golden brown, about 4-5 minutes per side.",
        "6. Drain on paper towels.",
        "7. Serve hot with your favorite dipping sauces."
      ],
    ),
    Recipe(
      name: "Fried Fish",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      imageUrl:
      "https://images.unsplash.com/photo-1606234157216-2e1fcbf0c140?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      cookingSteps: [
        "1. In a shallow dish, mix flour, cornmeal, paprika, garlic powder, salt, and pepper.",
        "2. Whisk the egg and milk in a separate bowl.",
        "3. Dip each fish fillet in the egg mixture, then coat in the flour mixture.",
        "4. Heat oil in a pan over medium-high heat.",
        "5. Fry the fish fillets for 3-4 minutes per side until golden brown.",
        "6. Drain on paper towels.",
        "7. Serve with lemon wedges and tartar sauce."
      ],
    ),
  ];

  final List<Recipe> _userFav = [];

  List<Recipe> get getRecipeList => recipes;

  List<Recipe> get userFav => _userFav;

  void addFavRecipe(Recipe recipe) {
    if (_userFav.contains(recipe)) {
      _userFav.remove(recipe);
    } else {
      _userFav.add(recipe);
    }
    notifyListeners();
  }

  void removeFavRecipe(Recipe recipe) {
    _userFav.remove(recipe);
    notifyListeners();
  }
}

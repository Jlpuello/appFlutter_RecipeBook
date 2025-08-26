import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/recipe_model.dart';
import 'package:flutter_application_1/providers/recipes_provider.dart';
import 'package:flutter_application_1/screens/detailRecipe.dart';
import 'package:provider/provider.dart';

class FavoriteRecipe extends StatelessWidget {
  const FavoriteRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipesProvider>(
        builder: (context, recipeProvider, child) {
          final favoriteRecipes = recipeProvider.favoriteRecipe;

          return favoriteRecipes.isEmpty
              ? Center(child: Text('No favorite recipes found'))
              : ListView.builder(
                  itemCount: favoriteRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = favoriteRecipes[index];
                    return favoriteRecipeCard(recipe: recipe);
                  },
                );
        },
      ),
    );
  }
}

class favoriteRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const favoriteRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipesData: recipe),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              recipe.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              recipe.author,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

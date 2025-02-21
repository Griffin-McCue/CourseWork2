import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class Recipe {
  final String name;
  final String ingredients;
  final String instructions;

  Recipe({required this.name, required this.ingredients, required this.instructions});
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: "Spaghetti Carbonara",
      ingredients: "Spaghetti, Eggs, Pancetta, Parmesan, Black Pepper",
      instructions: "1. Cook spaghetti. 2. Fry pancetta. 3. Mix eggs and cheese. 4. Combine all and serve.",
    ),
    Recipe(
      name: "Chicken Curry",
      ingredients: "Chicken, Onion, Tomato, Spices, Coconut Milk",
      instructions: "1. Sauté onions. 2. Add chicken and cook. 3. Add tomatoes and spices. 4. Pour coconut milk and simmer.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(recipe.ingredients, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Instructions:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(recipe.instructions, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
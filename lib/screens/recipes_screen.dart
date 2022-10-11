import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SimpleRecipe>>(
        future: exploreService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

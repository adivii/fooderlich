class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Recipe(this.label, this.imageUrl, this.servings, this.ingredients);

  static List<Recipe> samples = [
    Recipe("Spaghetti and Meatballs", "assets/spaghetti_meatballs.jpg", 4, [
      Ingredient(1, 'box', 'Spagheti'),
      Ingredient(4, '', 'Frozen Meatballs')
    ]),
    Recipe("Pizza", "assets/15452035777_294cefced5_c.jpg", 4,
        [Ingredient(1, 'pack', 'Flour'), Ingredient(2, '', 'Sausage')])
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}

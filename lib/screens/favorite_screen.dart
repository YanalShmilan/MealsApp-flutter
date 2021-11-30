import 'package:arabicflutter/models/meal.dart';
import 'package:arabicflutter/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeals;
  FavoriteScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no favorites yet",
          style: TextStyle(color: Colors.black),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favMeals[index].id,
            image: favMeals[index].imageUrl,
            title: favMeals[index].title,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
            duration: favMeals[index].duration,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}

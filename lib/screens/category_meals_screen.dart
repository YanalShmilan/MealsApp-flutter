import 'package:arabicflutter/models/meal.dart';
import 'package:arabicflutter/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(@required this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(routeArg['id']);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$categoryTitle Recipes"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              image: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}

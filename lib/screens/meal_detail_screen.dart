import 'package:arabicflutter/dummy_data.dart';
import 'package:arabicflutter/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meals_detail';
  final Function toggleFav;
  final Function isMealFav;

  MealDetailScreen(this.toggleFav, this.isMealFav);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      meal.ingredients[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFav(meal.id);
        },
        child:
            Icon(isMealFav(meal.id) ? Icons.star : Icons.star_border_outlined),
      ),
    );
  }
}

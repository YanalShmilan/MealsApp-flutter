import 'package:arabicflutter/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.amber,
              child: Text(
                "Cooking up!",
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text(
                "Meal",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 26,
              ),
              title: Text(
                "Filters",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, FiltersScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

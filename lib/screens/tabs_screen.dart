import 'package:arabicflutter/models/meal.dart';
import 'package:arabicflutter/screens/categories_screen.dart';
import 'package:arabicflutter/screens/favorite_screen.dart';
import 'package:arabicflutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;
  TabsScreen(this.favMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List _pages;

  int _selectedPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavoriteScreen(widget.favMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
            title: Text(
              "Categories",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            title: Text(
              "Favorites",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

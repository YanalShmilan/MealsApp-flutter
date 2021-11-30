import 'package:arabicflutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              'gluten': _isGlutenFree,
              'lactose': _isLactoseFree,
              'vegan': _isVegan,
              'vegetarian': _isVegetarian
            }),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meals selection",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text("Lactose-free"),
                value: _isLactoseFree,
                onChanged: (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                },
                subtitle: Text("Only include lactose-free meals."),
              ),
              SwitchListTile(
                title: Text("Vegan"),
                value: _isVegan,
                onChanged: (value) {
                  setState(() {
                    _isVegan = value;
                  });
                },
                subtitle: Text("Only include vegans meals."),
              ),
              SwitchListTile(
                title: Text("Gluten-free"),
                value: _isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                },
                subtitle: Text("Only include gluten-free meals."),
              ),
              SwitchListTile(
                title: Text("Vegetarian"),
                value: _isVegetarian,
                onChanged: (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                },
                subtitle: Text("Only include vegetarian meals."),
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

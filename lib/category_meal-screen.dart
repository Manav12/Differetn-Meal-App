import 'package:flutter/material.dart';
import './meal_item.dart';
import './meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routname = 'categorymeal';

  final List<Meal> mealsss;
  CategoryMealScreen(this.mealsss);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routdata =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catname = routdata['title'];
    final catid = routdata['id'];

    final categorymeal = widget.mealsss.where((meal) {
      return meal.categories.contains(catid);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catname),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: categorymeal[index].id,
                title: categorymeal[index].title,
                duration: categorymeal[index].duration,
                price: categorymeal[index].affordability,
                complex: categorymeal[index].complexity,
                imageurl: categorymeal[index].imageUrl);
          },
          itemCount: categorymeal.length,
        ));
  }
}

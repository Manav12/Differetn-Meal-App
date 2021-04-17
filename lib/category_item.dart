import 'package:flutter/material.dart';
import 'package:food_app/category_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(
    this.title,
    this.color,
    this.id
  );

  void getscreen(BuildContext ctx) {
  
    Navigator.of(ctx).pushNamed( 'categorymeal', arguments: { 'id': id, 'title': title }
      
    );
     
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getscreen(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "Raleway", fontSize: 24, color: Colors.black),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.9), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

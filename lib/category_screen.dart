import 'package:flutter/material.dart';
import './3.2 dummy_data.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return     GridView(
        padding: EdgeInsets.all(15),
     children: DUMMY_CATEGORIES.map((e) => CategoryItem(
       e.title,
       e.color,
       e.id
     )).toList(),
      
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio:1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
    
    
    
  }
}

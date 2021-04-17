import 'package:flutter/material.dart';
import './meal.dart';
import './meal_item.dart';

class FavouriteScreen extends StatelessWidget {
   
   List<Meal> favourite;
   FavouriteScreen(this.favourite);
 
  @override
  Widget build(BuildContext context) {

    if(favourite.isEmpty){
  return Center(child: Text("Favourite"));
    }
    else{
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: favourite[index].id,
                title: favourite[index].title,
                duration: favourite[index].duration,
                price: favourite[index].affordability,
                complex: favourite[index].complexity,
                imageurl: favourite[index].imageUrl);
          },
          itemCount: favourite.length,
        );
    }
   


  
      
  
  }
}
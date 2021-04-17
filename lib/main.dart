import 'package:flutter/material.dart';
import 'package:food_app/12.1%20dummy_data.dart';
import 'package:food_app/category_meal-screen.dart';
import 'package:food_app/default_tab_screen.dart';
import 'package:food_app/filter_screen.dart';
import './meal.dart';
import 'meal_detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Map<String, bool> filters = {
      'glutten': false,
      'lactose': false,
      'vegetatrian': false,
      'vegan':false,
    };
 
 List<Meal> getmealsinfo = DUMMY_MEALS;
 List<Meal> favourites = [];

  void _setfilter( Map<String, bool> filteredata ){
    setState(() {
      filters=filteredata;
      getmealsinfo = DUMMY_MEALS.where((meal){
        if(filters['glutten'] && !meal.isGlutenFree){
          return false;
        }
        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(filters['vegan'] && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void delectedfavourites(String mealid){
     final getindex =  favourites.indexWhere((element)  => element.id == mealid);
     if(getindex >= 0){
       setState(() {
         favourites.removeAt(getindex);
       });
     }
     else{
       favourites.add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
     }
  }

    
bool isfavourite (String id){
   return favourites.any((element) => element.id == id);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Meals",
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1:  TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          headline6: TextStyle(
            height: 24,
           color: Colors.black,
          )
        )
      ),
     routes: {
        
        '/': (ctx) => TabScreen(favourites),
      
        CategoryMealScreen.routname: (ctx) => CategoryMealScreen(getmealsinfo),
        MealDetailScreen.routname: (ctx) => MealDetailScreen(isfavourite,delectedfavourites),
        Filterscreen.routname: (ctx) => Filterscreen(filters,_setfilter),
                
      
      
      }
    );
  }
}




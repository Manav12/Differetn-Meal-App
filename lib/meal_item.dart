import 'package:flutter/material.dart';
import 'package:food_app/meal_detail_screen.dart';
import './meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final int duration;
  final String title;
  final String imageurl;
  final Complexity complex;
  final Affordability price;

  MealItem(
      {@required this.id,
        @required this.title,
      @required this.duration,
      @required this.price,
      @required this.complex,
      @required this.imageurl});


String get getcomplexity{
    switch(complex) {
      case Complexity.Simple:
      return 'Simple';
      break;
      case Complexity.Challenging:
      return 'Challenging';
      break;
      case Complexity.Hard:
      return 'Hard';
      break;
      default:
      return 'Unknown';
      break;
    
    }
    
}

String get money{
  switch (Affordability.Luxurious){
    case Affordability.Affordable:
    return 'Affordable';
    break;
    case Affordability.Luxurious:
    return 'Luxurious';
    break;
case Affordability.Pricey:
    return 'Pricey';
    break;
    default:
    return 'Unknown';
    break;
  }
}

void mealdetail(BuildContext context){
   Navigator.of(context).pushNamed(MealDetailScreen.routname, arguments: id,);
}


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {mealdetail(context);},
        splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(imageurl, fit: BoxFit.fill),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: Container(
                      width: 250,
                      color: Colors.black45,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(10), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                
                children: [
                Row(children: [
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text("$duration"),
                ],),
                Row(children: [
                  Icon(Icons.work),
                  SizedBox(width: 6,),
                  Text(getcomplexity),
                ],),
                Row(children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 6,),
                  Text(money),
                ],),
              ],),)
            ],
          ),
        ));
  }
}

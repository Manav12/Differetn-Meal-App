import 'package:flutter/material.dart';
import 'package:food_app/Facourite_screen.dart';
import 'package:food_app/category_screen.dart';
import './main_drawer.dart';
import './meal.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favourite;
TabScreen(this.favourite);

  static const routname = '/main';


  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 
 List<Widget> screens; 
  
   @override
   initState(){
    screens = [
       CategoryScreen(),
       FavouriteScreen(widget.favourite), 

]; 
super.initState();
   }

   int selectedindex = 0;
  void getindex( int index){
           setState(() {
             selectedindex = index;
           });
   }
 



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          ) ,
          drawer: MainDrawer(),
        body: screens[selectedindex],
           bottomNavigationBar: BottomNavigationBar(elevation: 4,
           selectedItemColor: Colors.yellow,
           backgroundColor: Colors.green,
           unselectedItemColor: Colors.white,
           currentIndex: selectedindex,
           onTap: getindex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Cateogory',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favourites",
              ),
            ],
            )
      
    
     );
      }
}

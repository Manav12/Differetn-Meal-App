import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
  Widget listtile( String title, IconData icon, Function ontap  )
  {

    return   ListTile(
         leading: Icon(
           icon, 
           size: 26,
         ),
         title: Text(title, style: TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,
           color: Colors.yellow,
         ),),
         onTap: ontap ,
       
       
       );


      }
 

    return Drawer(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Colors.green[100],
            child: Text(
              "Happy Meals",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
            ),
          ),
          listtile('Meals', Icons.restaurant, (){
                    Navigator.of(context).pushNamed('/');
          }),
 listtile("Filters", Icons.star, (){
    Navigator.of(context).pushNamed('fliterscreen');
 }),
 
          
                
        ],
      ),
    );
  }
}

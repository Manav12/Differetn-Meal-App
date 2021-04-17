import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/12.1%20dummy_data.dart';
import 'package:food_app/main_drawer.dart';

class MealDetailScreen extends StatelessWidget {
    final Function favourites;
    final Function select;
    MealDetailScreen(this.select, this.favourites);




  static const routname = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final getid = ModalRoute.of(context).settings.arguments as String;
    final caatid = DUMMY_MEALS.firstWhere((element) => element.id == getid);

    return Scaffold(
      appBar: AppBar(
        title: Text(caatid.title),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[50],
          width: 50000,
          child: Column(
            children: [
              Card(
                child: Image.network(
                  caatid.imageUrl,
                  width: 400,
                  height: 240,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Ingrdients',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.lime,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(caatid.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: caatid.ingredients.length,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Steps To Follow',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(caatid.steps[index]),
                    );
                  },
                  itemCount: caatid.steps.length,
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          select(getid) ? Icons.star : Icons.star_border),
        onPressed: () => favourites(getid),
      ),
    );
  }
}

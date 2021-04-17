import 'package:flutter/material.dart';

class Filterscreen extends StatefulWidget {
  static const routname = 'fliterscreen';
  final Function filtered;
  final Map<String, bool> filters;
  Filterscreen(this.filters, this.filtered);

  @override
  _FilterscreenState createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  var isgluttenfree = false;

  var islactosefree = false;

  var isvegetarian = false;

  var isvegan = false;
  
 

  Widget getfilter(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile(
        activeColor: Colors.orange,
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 10),
        ),
        value: value,
        onChanged: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter screen"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final filters = {
      'glutten': isgluttenfree,
      'lactose': islactosefree,
      'vegetatrian': isvegetarian,
      'vegan':isvegan,
    };
                  widget.filtered(filters);
                }),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Set Your Preferences',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  getfilter('Isgluttenfree', 'Only contains glutten free meals',
                      isgluttenfree, (newvalue) {
                    setState(() {
                      isgluttenfree = newvalue;
                    });
                  }),
                  getfilter('Islactosefree', 'Only contains lactose free meals',
                      islactosefree, (newvalue) {
                    setState(() {
                      islactosefree = newvalue;
                    });
                  }),
                  getfilter('IsVegetarian', 'Only contains vegetarian meals',
                      isvegetarian, (newvalue) {
                    setState(() {
                      isvegetarian = newvalue;
                    });
                  }),
                  getfilter(
                      'IsVegan', 'Only contains glutten free meals', isvegan,
                      (newvalue) {
                    setState(() {
                      isvegan = newvalue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}

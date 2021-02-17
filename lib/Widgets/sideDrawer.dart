import'package:flutter/material.dart';
class SideDrawer extends StatelessWidget {
  final Function add;
  SideDrawer(this.add);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
    Container(
      height: 100,
        child: DrawerHeader(
          child: Text('EXPENSES',style: TextStyle(color: Colors.white, fontSize: 20),),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            
            
          ),
        ),
      ),
      ListTile(
        trailing: IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: (){Navigator.of(context).pop();
          add(context);},
        )
        ,
        title:  Text('ADD New Trancaction',textAlign: TextAlign.justify,style: TextStyle(color: Colors.deepOrange,fontSize: 15)),
        
      ),
    ]
      )
    );
  }
}
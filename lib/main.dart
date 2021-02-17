import 'package:Expense_Tracker/Widgets/BarChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


import 'Widgets/Lists.dart';
import 'Widgets/NewSheet.dart';
import 'Widgets/sideDrawer.dart';
import 'models/Transaction.dart';

void main() {
  
 // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
  
  runApp(Myapp());}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.light(primary: Colors.deepOrange ),
        accentColor:Colors.deepOrange,
        splashColor: Colors.deepOrange,
      ),
      title: "Expense_Tracker",
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<Transaction> list = [
    new Transaction(DateTime.now().toString(), "Mukul", 55, DateTime.now()),
    new Transaction(DateTime.now().toString(), "MegaMind", 66, DateTime.now())
  ];

  void add(ctx) {
    showModalBottomSheet(context: ctx, builder: (_){
return NewSheet(addInList);
    });
  }
  bool showChart=false;

    List<Transaction> get recentTransaction {
    return list.where((tx) {
      return tx.date.isAfter(DateTime.now().
      subtract(Duration(days: 7),));
    }).toList();
    // iterates over elemnt and check if it follows new list
  }
void addInList(String title, double Amount,DateTime date){
  setState(() {
      list.add(  new Transaction(DateTime.now().toString(),title,Amount,date));
    });

}
  void delete(String id) {
   setState(() {
   //  list.removeWhere((tx)=> tx.id==id);
   // two methods
      for (int i = 0; i < list.length; i++) {
      String s = list[i].id;
   
      if (id == s) {
       
        list.remove(list[i]);
      }
    }
      }); 
  }

  @override
  Widget build(BuildContext context) {
    final appbar=AppBar(
          title: Text("Expenses",
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Colors.deepOrange,
          actions: [
            IconButton(
          icon: Icon(Icons.add),
          onPressed: (){add(context);},
             ),
              ],
          
        );
 final isLandscape=MediaQuery.of(context).orientation==Orientation.landscape;
 final listWidget=  Container( child:Lists(list, delete),
               height: (MediaQuery.of(context).size.height-appbar.preferredSize.height) *0.7,
               );
               final chartWidget= Container(
                height: (MediaQuery.of(context).size.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top) 
                ,child: BarChart(recentTransaction)); 
   
    return Scaffold(
        appBar: appbar, 
        drawer: SideDrawer(add),
        body: SingleChildScrollView(
          child: Column(
            children: [
             if(isLandscape) Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Text"),
                  
                  Switch(value: showChart ,onChanged:(val){
setState(() {
  showChart =val;
});
                  } ,),
                ],
              ),
              if(isLandscape)
       showChart? chartWidget:
              listWidget,
              if(!isLandscape) Container(
                height: (MediaQuery.of(context).size.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top) *0.3
                ,child: BarChart(recentTransaction)),
              if(!isLandscape)   Container( child:Lists(list, delete),
               height: (MediaQuery.of(context).size.height-appbar.preferredSize.height) *0.7)
             
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child:  Icon(
            Icons.add
          ),
          backgroundColor: Colors.deepOrange,
          onPressed: (){add(context);},
        ));
  }
}
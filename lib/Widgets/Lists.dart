import 'package:Expense_Tracker/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Lists extends StatelessWidget {
  @override
  final List<Transaction> list;
   final Function delete;
  Lists(this.list,this.delete);

  Widget build(BuildContext context) {
    return Container(
    
      child: list.isEmpty? Column(
        children: [
          Text("No Transaction"),
        ],
      ):
      ListView.builder(itemBuilder:(context,index){
    return Card(
             margin: EdgeInsets.symmetric(vertical:8,horizontal:10),
      elevation: 5,
      child: ListTile(
      leading:CircleAvatar(
        backgroundColor: Colors.deepOrange[300],
        radius: 30,
        child: Container(
          padding: EdgeInsets.all(7),
          child: FittedBox(
            child: Text("₹"+list[index].amount.toStringAsFixed(2),style: TextStyle(color:Colors.white),),),
        ),) ,title: Text(list[index].title),
        subtitle: Text(DateFormat.yMMMd().format(list[index].date)),
        trailing: IconButton(
          icon: Icon(Icons.delete,color: Colors.red,), 
          onPressed: (){
            print("clicked");
            delete(list[index].id);
          }
          ,),
      ),);
        

      },
      itemCount: list.length,),
      
    );
  }
}


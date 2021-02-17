import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
class NewSheet extends StatefulWidget {
  final Function addInList;
  NewSheet(this.addInList);

  @override
  _NewSheetState createState() => _NewSheetState();
}

class _NewSheetState extends State<NewSheet> {

  final GetTitle = TextEditingController();

  final GetAmount = TextEditingController();
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 15,
        child: Container(
          margin: EdgeInsets.only(top: 10 , left:10 , right: 10 ,bottom: MediaQuery.of(context).viewInsets.bottom +10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                keyboardType: TextInputType.name,
                controller: GetTitle,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                controller: GetAmount,
              ),
              FittedBox(),
              Row(
                children: [
              date!=null ?  Text( DateFormat.yMd().format(date)):Text("No date choosen"),
                  FlatButton(
                    child: Text(
                      "Select Date",
                      style: TextStyle(color: Colors.deepOrange),
                      
                    ),
                    onPressed: (){
                    showDatePicker(context: context, 
                    initialDate: DateTime.now(),
                    
                    firstDate:DateTime(2020),lastDate:DateTime.now(),
                    confirmText: "Select",

                   ).then((pickedDate){
if(pickedDate==null) return ;
else{ setState(() {
  date=pickedDate;
});
}
                   });
                    },
                  )
                ],
              ),
              FlatButton(
                child: Text("Add New Transaction"),
                color: Colors.deepOrange,
                onPressed: () {
                  final double Amount = double.parse(GetAmount.text);
                  if (GetTitle.text.isEmpty == false && Amount != null && date!=null) {
                    widget.addInList(GetTitle.text, Amount,date);
                    Navigator.of(context).pop();
                  } else if (Amount < 0) {
                    return;
                  } else {
                    return;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

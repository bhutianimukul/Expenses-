import 'package:Expense_Tracker/Widgets/ChartGraph.dart';
import 'package:Expense_Tracker/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
class BarChart extends StatelessWidget {
final List<Transaction> recentTransactions;
  @override
  BarChart(this.recentTransactions);
List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum=0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalsum += recentTransactions[i].amount;
          
        }
      }
   

      return {
        // return map

        'days': DateFormat.E().format(weekDay), 'amount': totalsum
      };
    }).reversed.toList();
   

 
}
double get maxSpent{
return groupedTransactionsValues.fold(0.0,(sum,item){
return sum+ item['amount'];
});
}
  @override
  Widget build(BuildContext context) {
     return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data){
print(data['days']);
return Flexible(
  fit: FlexFit.tight,

  child:   ChartGraph(data['days'],data['amount'],
  maxSpent==0.0?0.0:(data['amount']as double)/maxSpent ),
);
          }).toList(),
        ),
      ), 
    );
  }
  }

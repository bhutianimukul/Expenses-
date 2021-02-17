import 'package:flutter/material.dart';

class ChartGraph extends StatelessWidget {
  final String label;
  final double totalspent;
  final double amount ;
  ChartGraph(this.label, this.amount, this.totalspent);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,constraint){
return Column(
      children: [
        Container(
            height: constraint.maxHeight*0.15,
            child: FittedBox(child: Text(amount.toStringAsFixed(0)))),
        SizedBox(
            height: constraint.maxHeight*0.05,
        ),
        Container(
          height: constraint.maxHeight*0.6,
          width: 10,
          
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(width:1.0,color: Colors.black,
              ),
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20)),
              ),FractionallySizedBox(
                heightFactor: totalspent,
                child: Container(
                decoration: BoxDecoration(color: Colors.grey,
                borderRadius: BorderRadius.circular(20),)
                ),
                ),
            ],
            ),
        ),
        SizedBox(
            height: constraint.maxHeight*0.05,
        ),
        Container(child: FittedBox(child: Text(label)),  height: constraint.maxHeight*0.15,)
      ],
    );
    },);
  
    
  }
}

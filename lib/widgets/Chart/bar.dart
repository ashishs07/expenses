import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String title;
  final double spending;
  final double totalSpending;

  Bar(this.title, this.spending, this.totalSpending);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Column(
        children: <Widget>[
          Container(child: Text(title)),
          SizedBox(height: 5),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor:
                      totalSpending <= 0 ? 0 : spending / totalSpending,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          FittedBox(
            child: Text(spending.toStringAsFixed(0)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String title;
  final double spending;
  final double totalSpending;

  Bar(this.title, this.spending, this.totalSpending);

  Widget _buildBottomContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        color: Color.fromRGBO(220, 220, 220, 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildTopColoredContainer(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: totalSpending <= 0 ? 0 : spending / totalSpending,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildOnlyBar(BuildContext context, double height) {
    return Container(
      height: height,
      width: 10,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          _buildBottomContainer(),
          _buildTopColoredContainer(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(title),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            _buildOnlyBar(context, constraints.maxHeight * 0.60),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('₹${spending.toStringAsFixed(0)}'),
              ),
            ),
          ],
        );
      },
    );
  }
}

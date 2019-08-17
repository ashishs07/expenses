import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TxCard extends StatelessWidget {
  final Transaction tx;

  TxCard(this.tx);

  Widget _buildPriceContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: _buildPriceContainerDecoration(),
      child: Text(
        '\$${tx.amount}',
        style: _buildPriceStyle(),
      ),
    );
  }

  BoxDecoration _buildPriceContainerDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.purple,
        width: 1.5,
      ),
    );
  }

  TextStyle _buildPriceStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.purple,
    );
  }

  Widget _buildTitleContainer() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Text(
        tx.title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildDateContainer() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      child: Text(
        DateFormat.yMMMd().format(tx.date),
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          _buildPriceContainer(),
          Expanded(
            child: Column(
              children: <Widget>[
                _buildTitleContainer(),
                _buildDateContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TxCard extends StatelessWidget {
  final Transaction tx;

  TxCard(this.tx);

  Widget _buildLeadingWidget(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
      child: FittedBox(
        child: Text(
          '₹${tx.amount.toStringAsFixed(0)}',
          style: _buildPriceStyle(context),
        ),
      ),
    );
  }

  TextStyle _buildPriceStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Theme.of(context).accentColor,
    );
  }

  Widget _buildTitleWidget() {
    return Text(
      tx.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _buildSubtitleWidget() {
    return Text(
      DateFormat.yMMMd().format(tx.date),
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: _buildLeadingWidget(context),
        title: _buildTitleWidget(),
        subtitle: _buildSubtitleWidget(),
      ),
    );
  }
}

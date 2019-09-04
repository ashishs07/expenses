import 'package:flutter/material.dart';

import '../../models/transaction.dart';

import './txcard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  Widget _buildEmptyPageReplacement() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text('No Transactions'),
      ],
    );
  }

  Widget _buildListViewCards() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TxCard(transactions[index], delTx);
      },
      itemCount: transactions.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: transactions.isEmpty
            ? _buildEmptyPageReplacement()
            : _buildListViewCards(),
      ),
    );
  }
}

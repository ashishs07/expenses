import 'package:flutter/material.dart';

import '../models/transaction.dart';

import '../widgets/txcard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TxCard(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/transaction.dart';

import './txcard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  Widget _buildEmptyPageReplacement(double height, BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: <Widget>[
              SizedBox(height: height * 0.05),
              Container(
                height: height <= 800 ? height * 0.5 : height * 0.8,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * .05),
              Container(
                height: height * 0.1,
                child: Text('No Transactions'),
              ),
            ],
          )
        : Column(
            children: <Widget>[
              SizedBox(height: height * 0.05),
              Container(
                height: height * 0.8,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * .05),
              Container(
                height: height * 0.1,
                child: Text('No Transactions'),
              ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: transactions.isEmpty
              ? _buildEmptyPageReplacement(constraints.maxHeight, context)
              : _buildListViewCards(),
        );
      },
    );
  }
}

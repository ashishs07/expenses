import 'package:flutter/material.dart';

import './widgets/Tx/tx_list.dart';
import './widgets/new_tx.dart';
import './widgets/Chart/chart.dart';
import './models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  bool _showChart = false;

  void startAddTxModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTx(_addTransaction);
        });
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expenses'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startAddTxModal(context);
          },
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? _portraitView(appBar)
          : _landscapeView(appBar),
      floatingActionButton:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    startAddTxModal(context);
                  },
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _portraitView(AppBar appBar) {
    return ListView(
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.25,
          child: Chart(_recentTransactions),
        ),
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top) *
              0.75,
          child: TransactionList(_transactions, _deleteTransaction),
        ),
      ],
    );
  }

  Widget _landscapeView(AppBar appBar) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Show Chart'),
            Switch(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              },
            ),
          ],
        ),
        _showChart
            ? Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Chart(_recentTransactions),
              )
            : Expanded(
                child: TransactionList(_transactions, _deleteTransaction),
              ),
      ],
    );
  }
}

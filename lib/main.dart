import 'package:flutter/material.dart';

import './transaction.dart';
import './txcard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.teal),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 35,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Watch',
      amount: 75,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expenses'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: <Widget>[
          Card(
            child: Text('Chart'),
          ),
          Card(
              child: Column(
            children: <Widget>[
              TextField(),
              TextField(),
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: transactions.map((tx) {
              return TxCard(tx);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

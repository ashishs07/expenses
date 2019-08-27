import 'package:flutter/material.dart';

class NewTx extends StatefulWidget {
  final Function addTransaction;

  NewTx(this.addTransaction);

  @override
  _NewTxState createState() => _NewTxState();
}

class _NewTxState extends State<NewTx> {
  String title;
  double amount;

  void submitTx() {
    final enteredTitle = title;
    final enteredAmount = amount;
    if (enteredTitle == null || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (val) {
                  title = val;
                },
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitTx(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                onChanged: (val) {
                  amount = double.parse(val);
                },
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onSubmitted: (_) => submitTx(),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitTx,
              )
            ],
          ),
        )
      ],
    );
  }
}

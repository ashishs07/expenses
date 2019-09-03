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

    Navigator.of(context).pop();
  }

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Title'),
      onChanged: (val) {
        title = val;
      },
      keyboardType: TextInputType.text,
      onSubmitted: (_) => submitTx(),
    );
  }

  Widget _buildAmountTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Amount'),
      onChanged: (val) {
        amount = double.parse(val);
      },
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      onSubmitted: (_) => submitTx(),
    );
  }

  Widget _buildAddFlatButton() {
    return FlatButton(
      child: Text('Add Transaction'),
      textColor: Theme.of(context).accentColor,
      onPressed: submitTx,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildTitleTextField(),
          _buildAmountTextField(),
          _buildAddFlatButton(),
        ],
      ),
    );
  }
}

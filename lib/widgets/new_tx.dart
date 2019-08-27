import 'package:flutter/material.dart';

class NewTx extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTx(this.addTransaction);

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle == null || enteredAmount <= 0) {
      return;
    }

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Text('Chart'),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitTx(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
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

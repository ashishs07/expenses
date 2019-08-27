import 'package:flutter/material.dart';

Future showModal(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (assa) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // controller: titleController,
                keyboardType: TextInputType.text,
                //onSubmitted: (_) => submitTx(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // controller: amountController,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                // onSubmitted: (_) => submitTx(),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: () {},
              )
            ],
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTx extends StatefulWidget {
  final Function addTransaction;

  NewTx(this.addTransaction);

  @override
  _NewTxState createState() => _NewTxState();
}

class _NewTxState extends State<NewTx> {
  String title;
  double amount;
  DateTime _selectedDate;

  void submitTx() {
    final enteredTitle = title;
    final enteredAmount = amount;
    if (enteredTitle == null || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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

  Widget _buildAddRaisedButton() {
    return RaisedButton(
      child: Text(
        'Add Transaction',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: submitTx,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildTitleTextField(),
          _buildAmountTextField(),
          Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected !'
                        : DateFormat.yMd().format(_selectedDate),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _presentDatePicker,
                      ),
                    ),
                  )
                ],
              )),
          _buildAddRaisedButton(),
        ],
      ),
    );
  }
}

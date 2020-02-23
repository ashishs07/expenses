import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTx extends StatefulWidget {
  final Function addTransaction;

  NewTx(this.addTransaction);

  @override
  _NewTxState createState() => _NewTxState();
}

class _NewTxState extends State<NewTx> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime _selectedDate;

  void submitTx() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    _formKey.currentState.save();

    widget.addTransaction(
        _title.text, double.parse(_amount.text), _selectedDate);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _buildTitleTTF(),
            _buildAmountTTF(),
            _buildDateRow(),
            _buildAddRaisedButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleTTF() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      keyboardType: TextInputType.text,
      controller: _title,
      validator: (val) {
        if (val.isEmpty) {
          return 'Enter Title.';
        }
        return null;
      },
      onSaved: (val) {
        _title.text = val;
      },
    );
  }

  Widget _buildAmountTTF() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Amount'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: _amount,
      validator: (val) {
        if (val.isEmpty) {
          return 'Enter Amount';
        }
        if (double.tryParse(val) == null) {
          return 'Enter valid Amount';
        }
        if (double.parse(val) <= 0) {
          return 'Enter Amount';
        }
        return null;
      },
      onSaved: (val) {
        _amount.text = val;
      },
    );
  }

  Widget _buildDateRow() {
    return Row(
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
}

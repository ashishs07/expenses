import 'package:flutter/material.dart';

class WeekNavi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        Expanded(
            child: Center(
          child: Container(
            child: Text('Week Number'),
          ),
        )),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ],
    );
  }
}

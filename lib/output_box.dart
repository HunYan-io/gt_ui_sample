import 'package:flutter/material.dart';

class MyOutputBox extends StatelessWidget {
  final String output;
  MyOutputBox({Key key, this.output}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Container(
                constraints: BoxConstraints(minHeight: 120),
                padding: EdgeInsets.all(15),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

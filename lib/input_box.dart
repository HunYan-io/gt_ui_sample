import 'package:flutter/material.dart';

class MyInputBox extends StatelessWidget {
  final FocusNode focusNode;
  final String value;
  final void Function(String) onChanged;
  final void Function() onSubmitted;
  MyInputBox(
      {Key key, this.focusNode, this.value, this.onChanged, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                      ),
                      controller: (() {
                        final controller = TextEditingController(text: value);
                        controller.selection = TextSelection.collapsed(
                            offset: controller.text.length);
                        return controller;
                      })(),
                      textInputAction: TextInputAction.send,
                      onChanged: onChanged,
                      onSubmitted: (_) => onSubmitted(),
                      maxLines: 3,
                      minLines: 3,
                      maxLength: 250,
                      maxLengthEnforced: true,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: IconButton(
                      icon: Icon(Icons.send),
                      color: Theme.of(context).primaryColor,
                      splashRadius: 18,
                      onPressed: onSubmitted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

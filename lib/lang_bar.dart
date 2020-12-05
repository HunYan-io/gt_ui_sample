import 'package:flutter/material.dart';
import 'dropdown_button.dart';

class MyLangBar extends StatelessWidget {
  final String autoRealSrc, from, to;
  final Function(String) onFromChanged, onToChanged;
  final Function onSwap;
  MyLangBar(
      {Key key,
      this.autoRealSrc,
      this.from,
      this.to,
      this.onFromChanged,
      this.onToChanged,
      this.onSwap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).highlightColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: MyDropdownButton(
              automatic: true,
              autoRealSrc: autoRealSrc,
              value: from,
              onChanged: onFromChanged,
            ),
          ),
          Flexible(
            child: IconButton(
              color: Theme.of(context).primaryColor,
              splashRadius: 18,
              icon: Icon(Icons.swap_horiz_rounded),
              onPressed: onSwap,
            ),
          ),
          Expanded(
            child: MyDropdownButton(
              automatic: false,
              value: to,
              onChanged: onToChanged,
            ),
          ),
        ],
      ),
    );
  }
}

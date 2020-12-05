import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import 'input_box.dart';
import 'output_box.dart';
import 'lang_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _from = 'auto', _to = 'en', _input = '', _output = '';
  String _source;
  var _focusNode = FocusNode();
  static final _translator = GoogleTranslator();

  void _translate() {
    _translator.translate(_input, from: _from, to: _to).then((translation) {
      setState(() {
        _output = translation.text;
        _source = _from == 'auto'
            ? (translation.sourceLanguage.code == 'auto'
                ? 'en'
                : translation.sourceLanguage.code)
            : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Translator'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  MyLangBar(
                    from: _from,
                    to: _to,
                    autoRealSrc: _source,
                    onFromChanged: (from) {
                      setState(() {
                        _from = from;
                      });
                      _translate();
                    },
                    onSwap: () {
                      var temp = _from == 'auto' ? (_source ?? 'en') : _from;
                      setState(() {
                        _input = _output;
                        _from = _to;
                        _to = temp;
                      });
                      _translate();
                    },
                    onToChanged: (to) {
                      setState(() {
                        _to = to;
                      });
                      _translate();
                    },
                  ),
                  MyInputBox(
                    focusNode: _focusNode,
                    value: _input,
                    onChanged: (input) {
                      _input = input;
                    },
                    onSubmitted: () {
                      _focusNode.unfocus();
                      _translate();
                    },
                  ),
                  MyOutputBox(
                    output: _output,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

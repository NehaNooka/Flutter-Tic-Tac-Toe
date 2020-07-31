import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final actionText;

  CustomDialog(this.title, this.content, [this.actionText = "Reset"]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: <Widget>[
          new FlatButton(
            color: Colors.white,
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
  }
}

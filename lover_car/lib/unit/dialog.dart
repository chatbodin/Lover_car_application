import 'package:flutter/material.dart';
import 'package:lover_car/unit/my_style.dart';

Future<Null> normalDialog(
    BuildContext context, String? title, String? message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Mystyle().showLogo(),
        title: Text(
          title!,
          style: Mystyle().activeStyle(),
        ),
        subtitle: Text(
          message!,
          style: Mystyle().darkStyle(),
        ),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}

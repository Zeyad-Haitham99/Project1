import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';

class AlertDialog extends StatefulWidget {
  const AlertDialog({Key key}) : super(key: key);

  @override
  _AlertDialogState createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialog> {
  get cupertinoAlertdialoge => null;

  @override
  Widget build(BuildContext context) {
    return cupertinoAlertdialoge(
      tilte: Text("Accept?"),
      content: Text("aaaaaaaa?"),
      action: [cupertinoAlertdialoge("no"), cupertinoAlertdialoge("Yes")],
    );
  }
}

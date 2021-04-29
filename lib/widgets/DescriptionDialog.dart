import 'package:flutter/material.dart';

class DescriptionDialog extends StatelessWidget {
  DescriptionDialog({@required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Description"),
            IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(Icons.cancel_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Text(description),
      ),
    );
  }
}

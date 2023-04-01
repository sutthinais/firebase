// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class GrabAlertDialog extends StatefulWidget {
  final List<Widget>? actions;
  const GrabAlertDialog(this.actions, {super.key});
  @override
  _GrabAlertDialogState createState() => _GrabAlertDialogState();
}

class _GrabAlertDialogState extends State<GrabAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Title',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Description',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          if (widget.actions != null) ...[
            Row(
              children: const [],
            )
          ]
        ],
      ),
    );
  }
}

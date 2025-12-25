/* about_dialog.dart defines the dialog page that displays when clicking on a lift
 *
 * The
 */

import 'package:flutter/material.dart';

Widget _buildAboutDialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Pop up on lift"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

      ],
    )
  );
}
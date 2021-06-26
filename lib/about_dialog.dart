/* about_dialog.dart defines the dialog page that displays when clicking on a lift
 *
 * The
 */

import 'package:flutter/material.dart';
import 'lift.dart';

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text("Pop up on lift"),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

      ],
    )
  );
}
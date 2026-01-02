/* edit_lift.dart defines the EditLift widget
 *
 * The EditLift widget allows the user to edit features
 * about a specific lift.
 *
 * Created by: Luke Steffen
 * Date 01/01/2026
 */

import 'package:flutter/material.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift.dart';

class EditLift extends StatelessWidget {
  EditLift({super.key, required this.lift});
  EditLift.otherConstructor(this.lift);

  Lift lift;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();

    return Scaffold();
  }
}

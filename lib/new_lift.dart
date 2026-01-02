/* new_lift.dart defines the NewLift widget
 *
 * The NewLift widget allows the user to add a new lift to
 * the already existing lifts.
 *
 * Created by: Luke Steffen
 * Date 01/01/2026
 */

import 'package:flutter/material.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift.dart';

class NewLift extends StatefulWidget {
  const NewLift({super.key});

  @override
  State<NewLift> createState() => _NewLiftState();
}

class _NewLiftState extends State<NewLift> {
  late Lift newLift;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();
    int newId = appState.getNewestId();

    return Scaffold(
      appBar: AppBar(
        title: Text("New Lift"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("New ID: ${newId}"),
          )
        ],
      ),
    );
  }
}

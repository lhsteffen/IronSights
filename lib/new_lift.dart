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
  Lift newLift = Lift.emptyLift();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();
    int newId = appState.getNewestId();

    newLift.setId(newId);

    return Scaffold(
      appBar: AppBar(
        title: Text("New Lift"),
      ),
      body: Flexible(
        child: Column(
          children: [
            Text(
              "Lift Name",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                )
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          "Heavy Weight",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5.0,),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        Text(
                          "Light Weight",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                              )
                            ),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            Text(
              "Barbell",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            Checkbox(
              value: false,
              onChanged: (bool? value) {
                print("Hello");
              }
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}

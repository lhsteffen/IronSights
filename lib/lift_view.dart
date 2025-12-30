/* lift_view.dart defines the LiftView class
 *
 * The LiftView function is used to display a Lift item on the screen
 * for user interaction
 *
 * Created by: Luke Steffen
 * Date: 10/25/2020
 */

// NOTES: THE TOP ROWS NEED TO BE CHANGED TO COLUMNS PROPERLY

import 'package:flutter/material.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift.dart';

class LiftView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();
    List<Lift> lifts = appState.liftItems;

    return ListView.separated(
      separatorBuilder: (buildContext, index) => Divider(),
      itemCount: lifts.length,
      padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
      itemBuilder: (BuildContext buildContext, int index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (BuildContext context) {
                return SafeArea(
                    child: LiftDetails(lift: lifts[index]),
                );
              }
            );
          },
          onDoubleTap: () {
            print("Edit");
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 10),
                        child: Text(
                          lifts[index].getName(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container (
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 20),
                        child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Light: ",
                                    style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                    text: "${lifts[index].getLight()} lbs",
                                    style: TextStyle(color: Colors.black87)
                                ),
                              ]
                          ),
                        ),
                      ),
                      Expanded(
                          child: Center (
                            child: Container(
                              child: RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Heavy: ",
                                          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                                      ),
                                      TextSpan(
                                          text: "${lifts[index].getHeavy()} lbs",
                                          style: TextStyle(color: Colors.black87)
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LiftDetails extends StatelessWidget {
  const LiftDetails({super.key, required this.lift});
  const LiftDetails.otherConstructor(this.lift);

  final Lift lift;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.expand_more_rounded)
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        print("More options!");
                      },
                      icon: Icon(Icons.more_vert)
                    ),
                  ),
                ],
              ),
              Text(lift.name),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Heavy: ",
                              style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "${lift.heavy} lbs",
                              style: TextStyle(color: Colors.black87)
                          ),
                        ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Light: ",
                              style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "${lift.light} lbs",
                              style: TextStyle(color: Colors.black87)
                          ),
                        ]
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                      text: TextSpan(
                        text: "Barbell: ",
                        style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                      )
                  ),
                  Checkbox(
                      value: lift.isBarbell(),
                      onChanged: (bool? value) {
                        print("check");
                      },
                  )
                ],
              ),
              if (lift.barbell)
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                          text: "Plates: ",
                          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                        )
                    )
                  ],
                ),
              Expanded(
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Description: ",
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                        )
                    ),
                    Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 10.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                          ),
                          child: Text(lift.desc),
                        ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: TextSpan(
                    text: "Routines: ",
                      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                  )
              )
            ]
          )
        ),
    );
  }
}

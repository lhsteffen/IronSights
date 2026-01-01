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
              shape: BeveledRectangleBorder(),
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
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.expand_more_rounded),
                    iconSize: 32,
                  ),
                  Expanded(
                    child: SizedBox()
                  ),
                  IconButton(
                    onPressed: () {
                      print("More options");
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: RichText(
                  text: TextSpan(
                    text: lift.name,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
                  )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: RichText(
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
                    )
                  ),
                  SizedBox(width: 24,),
                  Expanded(
                    child: Center(
                      child: RichText(
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
                    )
                  )
                ],
              ),
              if (lift.barbell)
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Plates",
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16)
                          )
                        )
                      ),
                      Divider(),
                      Column(
                        children: [
                          Text(
                            "Heavy",
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                          ),
                          PlateRow(plates: lift.getPlatesHeavy()),
                          SizedBox(height: 10),
                          Divider(),
                          Text(
                            "Light",
                            style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                          ),
                          PlateRow(plates: lift.getPlatesLight()),
                        ],
                      ),
                      Divider()
                    ],
                  )
                ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 30, bottom: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Description:",
                      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
                  width: MediaQuery.sizeOf(context).width - 10.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(lift.desc),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Routines",
                      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16)
                    )
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     RichText(
              //         text: TextSpan(
              //             text: "Barbell: ",
              //             style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
              //         )
              //     ),
              //     Checkbox(
              //       value: lift.isBarbell(),
              //       onChanged: (bool? value) {
              //         print("check");
              //       },
              //     )
              //   ],
              // ),
            ]
          )
        )
      ),
    );
  }
}

class PlateRow extends StatelessWidget {
  const PlateRow({super.key, required this.plates});
  const PlateRow.otherConstructor(this.plates);

  final Map<double, int> plates;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: plates.entries.map((plate) {
        if (plate.key == 2.5) {
          return Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "${plate.key}: ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: "${plate.value}",
                      style: TextStyle(color: Colors.black)
                    )
                  ]
                )
              ),
            )
          );
        }
        else {
          return Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "${plate.key.toInt()}: ",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: "${plate.value}",
                      style: TextStyle(color: Colors.black)
                    )
                  ]
                )
              ),
            )
          );
        }
      }).toList(),
    );
  }
}

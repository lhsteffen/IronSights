/* lift_view.dart defines the LiftView and LiftDetail classes
 *
 * The LiftView widget is used to display a Lift item on the screen
 * for user interaction
 *
 * The LiftDetail widget defines the page displayed when a user taps on
 * a lift, giving more details about the specified lift.
 *
 * Created by: Luke Steffen
 * Date: 10/25/2020
 */

// NOTES: THE TOP ROWS NEED TO BE CHANGED TO COLUMNS PROPERLY

import 'package:flutter/material.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'edit_lift.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => EditLift(lift: lifts[index]),
                )
            );
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
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
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.blueGrey,
                        iconSize: 20,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => EditLift(lift: lifts[index]),
                            )
                          );
                        },
                      ),
                    )
                  ],
                ),
                if (lifts[index].type == WeightType.lightHeavy)
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
                else if (lifts[index].type == WeightType.body)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Body Weight",
                                style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                            ),
                          ]
                        )
                      ),
                    ),
                  )
                else
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Weight: ",
                              style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                              text: "${lifts[index].work} lbs",
                              style: TextStyle(color: Colors.black87)
                            )
                          ]
                        )
                      ),
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
              if (lift.type == WeightType.lightHeavy)
                LightHeavyRow(lift: lift)
              else if (lift.type == WeightType.body)
                Text(
                  "Body Weight",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Weight: ",
                                style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                              ),
                              TextSpan(
                                text: "${lift.work} lbs",
                                style: TextStyle(color: Colors.black87)
                              ),
                            ]
                          )
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
                      if (lift.type == WeightType.lightHeavy)
                        Column(
                          children: [
                            Text(
                              "Heavy",
                              style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                            ),
                            PlateRow(plates: lift.getPlates(Load.heavy)),
                            SizedBox(height: 10),
                            Divider(),
                            Text(
                              "Light",
                              style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)
                            ),
                            PlateRow(plates: lift.getPlates(Load.light)),
                          ],
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: PlateRow(plates: lift.getPlates(Load.work)),
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
            ]
          )
        )
      ),
    );
  }
}

class LightHeavyRow extends StatelessWidget {
  const LightHeavyRow({super.key, required this.lift});
  const LightHeavyRow.otherConstructor(this.lift);

  final Lift lift;

  @override
  Widget build(BuildContext context) {
    return Row(
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

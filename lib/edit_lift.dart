/* edit_lift.dart defines the EditLift widget
 *
 * The EditLift widget allows the user to edit features
 * about a specific lift.
 *
 * Created by: Luke Steffen
 * Date 01/01/2026
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift.dart';

const List<Widget> weightTypes = <Widget>[Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text("Work")), Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text("Light/Heavy")), Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text("Body Weight"))];

class EditLift extends StatefulWidget {
  EditLift({super.key, required this.lift});
  EditLift.otherConstructor(this.lift);

  final Lift lift;

  @override
  State<EditLift> createState() => _EditLiftState();
}

class _EditLiftState extends State<EditLift> {

  late List<bool> _selectedWeightType = <bool>[widget.lift.isWorkWeight(), widget.lift.isLightHeavy(), widget.lift.isBodyWeight()];
  late List<bool> _selectedBarbell = <bool>[widget.lift.barbell];
  bool vertical = false;

  void changeWorkWeight(int? work) {
    setState(() {
      if (work != null) {
        widget.lift.work = work;
      }
    });
  }

  void changeLightWeight(int? light) {
    setState(() {
      if (light != null) {
        widget.lift.light = light;
      }
    });
  }

  void changeHeavyWeight(int? heavy) {
    setState(() {
      if (heavy != null) {
        widget.lift.heavy = heavy;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Lift"),
        actions: [
          TextButton(
              onPressed: () {
                appState.editLift(widget.lift);
                Navigator.pop(context);
              },
              child: Text("Save")
          )
        ],
      ),
      body: Column(
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
            initialValue: widget.lift.name,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                )
            ),
            onChanged: (text) {
              widget.lift.name = text;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
            isSelected: _selectedWeightType,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedWeightType.length; i++) {
                  _selectedWeightType[i] = i == index;
                }

                switch (index) {
                  case 0:
                    widget.lift.type = WeightType.work;
                    break;
                  case 1:
                    widget.lift.type = WeightType.lightHeavy;
                    break;
                  case 2:
                    widget.lift.type = WeightType.body;
                    break;
                }
              });
            },
            children: weightTypes,
          ),
          WeightEditEntry(lift: widget.lift, typeList: _selectedWeightType, setWork: changeWorkWeight, setLight: changeLightWeight, setHeavy: changeHeavyWeight),
          ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
            isSelected: _selectedBarbell,
            onPressed: (int index) {
              setState(() {
                _selectedBarbell[index] = !_selectedBarbell[index];
                widget.lift.barbell = _selectedBarbell[index];
              });
            },
            children: [Text("Barbell")],
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
            initialValue: widget.lift.desc,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                )
            ),
            onChanged: (text) {
              widget.lift.desc = text;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Add to Routines",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class WeightEditEntry extends StatelessWidget {
  WeightEditEntry({super.key, required this.lift, required this.typeList, required this.setWork, required this.setLight, required this.setHeavy});
  WeightEditEntry.otherConstructor(this.lift, this.typeList, this.setWork, this.setLight, this.setHeavy);

  final Lift lift;
  final List<bool> typeList;
  final void Function(int?) setWork;
  final void Function(int?) setLight;
  final void Function(int?) setHeavy;

  @override
  Widget build(BuildContext context) {
    if (typeList[0]) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Work Weight",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500
            ),
          ),
          Flexible(
            child: TextFormField(
              initialValue: lift.work.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
              ),
              onChanged: (text) {
                setWork(int.parse(text));
              },
            ),
          )
        ],
      );
    } else if (typeList[2]) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Body Weight",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500
            ),
          ),
          Flexible(
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
              ),
            ),
          )
        ],
      );
    } else {
      return Row(
        children: [
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
                TextFormField(
                  initialValue: lift.light.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      )
                  ),
                  onChanged: (text) {
                    setLight(int.parse(text));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 5.0),
          Flexible(
              fit: FlexFit.loose,
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
                  TextFormField(
                    initialValue: lift.heavy.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        )
                    ),
                    onChanged: (text) {
                      setHeavy(int.parse(text));
                    },
                  ),
                ],
              )
          )
        ],
      );
    }
  }
}

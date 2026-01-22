/* new_lift.dart defines the NewLift widget
 *
 * The NewLift widget allows the user to add a new lift to
 * the already existing lifts.
 *
 * Created by: Luke Steffen
 * Date 01/01/2026
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift.dart';

const List<Widget> weightTypes = <Widget>[Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text("Work")), Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text("Light/Heavy"))];

class NewLift extends StatefulWidget {
  const NewLift({super.key});

  @override
  State<NewLift> createState() => _NewLiftState();
}

class _NewLiftState extends State<NewLift> {
  Lift newLift = Lift.emptyLift();

  final List<bool> _selectedWeightType = <bool>[true, false];
  final List<bool> _selectedBarbell = <bool>[false];
  bool vertical = false;

  void changeWorkWeight(int? work) {
    setState(() {
      if (work != null) {
        newLift.work = work;
      }
    });
  }

  void changeLightWeight(int? light) {
    setState(() {
      if (light != null) {
        newLift.light = light;
      }
    });
  }

  void changeHeavyWeight(int? heavy) {
    setState(() {
      if (heavy != null) {
        newLift.heavy = heavy;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();
    int newId = appState.getNewestId();

    newLift.setId(newId);

    return Scaffold(
      appBar: AppBar(
        title: Text("New Lift"),
        actions: [
          TextButton(
            onPressed: () {
              appState.addLift(newLift);
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              )
            ),
            onChanged: (text) {
              newLift.name = text;
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
                newLift.lightHeavySplit = _selectedWeightType[1];
              });
            },
            children: weightTypes,
          ),
          WeightEntry(typeList: _selectedWeightType, setWork: changeWorkWeight, setLight: changeLightWeight, setHeavy: changeHeavyWeight),
          ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
            isSelected: _selectedBarbell,
            onPressed: (int index) {
              setState(() {
                _selectedBarbell[index] = !_selectedBarbell[index];
                newLift.barbell = _selectedBarbell[index];
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
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              )
            ),
            onChanged: (text) {
              newLift.desc = text;
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

class WeightEntry extends StatelessWidget {
  WeightEntry({super.key, required this.typeList, required this.setWork, required this.setLight, required this.setHeavy});
  WeightEntry.otherConstructor(this.typeList, this.setWork, this.setLight, this.setHeavy);

  final List<bool> typeList;
  final void Function(int?) setWork;
  final void Function(int?) setLight;
  final void Function(int?) setHeavy;

  @override
  Widget build(BuildContext context) {
    if (typeList[0] && !typeList[1]) {
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
            child: TextField(
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
                TextField(
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
                TextField(
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

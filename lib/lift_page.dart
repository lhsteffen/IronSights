import 'package:flutter/material.dart';
import 'lift_view.dart';
import 'test_list.dart';
import 'lift.dart';

class LiftPageWidget extends StatelessWidget {

  LiftPageWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListDisplay()
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new DynamicList();
}

class DynamicList extends State<ListDisplay> {
  List<Lift> litems = createList();
  @override
  Widget build(BuildContext bcntx) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new ListView.builder (
                itemCount: litems.length,
                itemBuilder: (BuildContext bcntx, int Index) {
                  return liftView(litems[Index]);
                },
              )
          )
        ],
      )
    );
  }
}
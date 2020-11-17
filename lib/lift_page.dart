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
          new Container(
            padding: EdgeInsets.only(bottom: 8, top: 8),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Order by",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 16
                  ),
                )
              ],
            ),
          ),
          new Expanded(
              child: new ListView.separated (
                separatorBuilder: (bcntx, Index) => Divider(),
                itemCount: litems.length,
                padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
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
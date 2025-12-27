import 'package:flutter/material.dart';
import 'lift_view.dart';
import 'test_list.dart';
import 'lift.dart';

class LiftPageWidget extends StatelessWidget {

  const LiftPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListDisplay()
    );
  }
}

class ListDisplay extends StatefulWidget {
  const ListDisplay({super.key});

  @override
  State createState() => DynamicList();
}

class DynamicList extends State<ListDisplay> {
  List<Lift> liftems = createList();
  @override
  Widget build(BuildContext bcntx) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 8, top: 8),
            child: Row(
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
          Expanded(
              child: ListView.separated (
                separatorBuilder: (bcntx, Index) => Divider(),
                itemCount: liftems.length,
                padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                itemBuilder: (BuildContext bcntx, int Index) {
                  return liftView(liftems[Index]);
                },
              )
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';

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
  List<String> litems = [];
  final TextEditingController ctrl = new TextEditingController();
  @override
  Widget build(BuildContext bcntx) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new TextField (
            controller: ctrl,
            onSubmitted: (text) {
              litems.add(text);
              ctrl.clear();
              setState(() {});
            },
          ),
          new Expanded(
              child: new ListView.builder (
                itemCount: litems.length,
                itemBuilder: (BuildContext bcntx, int Index) {
                  return new Text(litems[Index]);
                },
              )
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iron_sights/main.dart';
import 'package:provider/provider.dart';
import 'lift_view.dart';
import 'lift.dart';

class LiftPage extends StatelessWidget {

  const LiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LiftList()
    );
  }
}

class LiftList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<IronState>();
    List<Lift> lifts = appState.LiftItems;

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
              child: LiftView(),
            )
          ],
        )
    );
  }
}

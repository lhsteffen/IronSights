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
import 'lift.dart';

Container liftView(Lift lift) {
  if (lift.isBarbell()) {
    return new Container(
      child: new Row(),
    );
  } else {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  lift.getName(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          new Expanded(
            child: new Row(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Light: " + "${lift.getLight()}",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Heavy: " + "${lift.getHeavy()}",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
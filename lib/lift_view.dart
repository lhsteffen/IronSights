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
      height: 80,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8, top: 8, left: 10),
                child: Text(
                  lift.getName(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
                      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 20),
                      child: Text(
                        "Light: " + "${lift.getLight()}",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.all(8),
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
/* Test Lift list meant to test the display of lifts
 *
 * Created by: Luke Steffen
 * Date: 10/25/2020
 */

import 'lift.dart';

List<Lift> createList() {
  List<Lift> list = [];

  Lift l1 = new Lift("Dumbbell Curls", false, 30, 50, "Dumbbell curls, with your arms");
  Lift l2 = new Lift("Dumbbell Chest Press", false, 70, 90, "Chest press");
  Lift l3 = new Lift("Incline Chest Press", false, 60, 75, "Incline chest press");

  list.add(l1);
  list.add(l2);
  list.add(l3);

  return list;
}
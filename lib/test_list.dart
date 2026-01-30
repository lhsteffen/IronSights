/* Test Lift list meant to test the display of lifts
 *
 * Created by: Luke Steffen
 * Date: 10/25/2020
 */

import 'lift.dart';

List<Lift> createList() {
  List<Lift> list = [];

  Lift l1 = Lift.lightHeavy(1, "Dumbbell Curls", false, 30, 50, "Dumbbell curls, with your arms");
  Lift l2 = Lift.workWeightOnly(2, "Dumbbell Chest Press", false, 70, "Chest press");
  Lift l3 = Lift.lightHeavy(3, "Incline Chest Press", false, 60, 75, "Incline chest press");
  Lift l4 = Lift.workWeightOnly(4, "Bench Press", true, 205, "Bench Press");
  Lift l5 = Lift(5, "Deadlift", true, WeightType.work, 285, 225, 315, "Deadlift");
  Lift l6 = Lift(6, "Squat", true, WeightType.lightHeavy, 205, 185, 225, "Barbell squats");
  Lift l7 = Lift.bodyWeight(7, "Push Ups", "Push Ups");

  list.add(l1);
  list.add(l2);
  list.add(l3);
  list.add(l4);
  list.add(l5);
  list.add(l6);
  list.add(l7);

  return list;
}
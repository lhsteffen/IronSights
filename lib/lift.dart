/* lift.dart defines the lift class for IronSights
 *
 * The lift class defines and stores data on each type of
 * lift and is used within the ListList class to create a
 * list of lifts for the user to interact with.
 */

class Lift {
  int id = -1;
  String name = "";
  bool barbell = false;
  int light = -1;
  int heavy = -1;
  String desc = "";

  Lift.emptyLift();
  Lift(this.id, this.name, this.barbell, this.light, this.heavy, this.desc);

  // Begin getter functions
  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  bool isBarbell() {
    return barbell;
  }

  int getLight() {
    return light;
  }

  int getHeavy() {
    return heavy;
  }

  String getDescription() {
    return desc;
  }
  // End getter functions

  // Begin change functions
  void setId(int id) {
    this.id = id;
  }

  void setName(String name) {
    this.name = name;
  }

  void setBarbell(bool barbell) {
    this.barbell = barbell;
  }

  void setLight(int light) {
    this.light = light;
  }

  void setHeavy(int heavy) {
    this.heavy = heavy;
  }

  void setDescription(String desc) {
    this.desc = desc;
  }

  void increaseByFive(String type) {
    if (type == "light") {
      light = light + 5;
    } else if (type == "heavy") {
      heavy = heavy + 5;
    } else {
      print("ERROR: Incorrect addition, increaseByFive(String type)");
    }
  }
  // End change functions

  Map<double, int> getPlatesLight() {

    Map<double, int> plates = {};
    int weight = light - 45;
    int fortyFive = 0;
    int thirtyFive = 0;
    int twentyFive = 0;
    int ten = 0;
    int five = 0;
    int twoPointFive = 0;

    while (weight > 0) {
      if (weight - 90 >= 0) {
        fortyFive += 1;
        weight = weight - 90;
      } else if (weight - 70 >= 0) {
        thirtyFive += 1;
        weight = weight - 70;
      } else if (weight - 50 >= 0) {
        twentyFive += 1;
        weight = weight - 50;
      } else if (weight - 20 >= 0) {
        ten += 1;
        weight = weight - 20;
      } else if (weight - 10 >= 0) {
        five += 1;
        weight = weight - 10;
      } else if (weight - 5 >= 0) {
        twoPointFive += 1;
        weight = weight - 5;
      }
    }

    plates[45] = fortyFive;
    plates[35] = thirtyFive;
    plates[25] = twentyFive;
    plates[10] = ten;
    plates[5] = five;
    plates[2.5] = twoPointFive;

    return plates;
  }

  Map<double, int> getPlatesHeavy() {

    Map<double, int> plates = {};
    int weight = heavy - 45;
    int fortyFive = 0;
    int thirtyFive = 0;
    int twentyFive = 0;
    int ten = 0;
    int five = 0;
    int twoPointFive = 0;

    while (weight > 0) {
      if (weight - 90 >= 0) {
        fortyFive += 1;
        weight = weight - 90;
      } else if (weight - 70 >= 0) {
        thirtyFive += 1;
        weight = weight - 70;
      } else if (weight - 50 >= 0) {
        twentyFive += 1;
        weight = weight - 50;
      } else if (weight - 20 >= 0) {
        ten += 1;
        weight = weight - 20;
      } else if (weight - 10 >= 0) {
        five += 1;
        weight = weight - 10;
      } else if (weight - 5 >= 0) {
        twoPointFive += 1;
        weight = weight - 5;
      }
    }

    plates[45] = fortyFive;
    plates[35] = thirtyFive;
    plates[25] = twentyFive;
    plates[10] = ten;
    plates[5] = five;
    plates[2.5] = twoPointFive;

    return plates;
  }

}
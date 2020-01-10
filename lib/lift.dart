/* lift.dart defines the lift class for IronSights
 *
 * The lift class defines and stores data on each type of
 * lift and is used within the ListList class to create a
 * list of lifts for the user to interact with.
 */

class Lift {
  String name;
  bool barbell;
  int light;
  int heavy;
  String desc;

  Lift(String name, bool barbell, int light, int heavy, String desc) {
    this.name = name;
    this.barbell = barbell;
    this.light = light;
    this.heavy = heavy;
    this.desc = desc;
  }

  // Begin getter functions
  String getName() {
    return this.name;
  }

  bool isBarbell() {
    return this.barbell;
  }

  int getLight() {
    return this.light;
  }

  int getHeavy() {
    return this.heavy;
  }

  String getDescription() {
    return this.desc;
  }
  // End getter functions

  // Begin change functions
  void changeName(String name) {
    this.name = name;
  }

  void changeBarbell(bool barbell) {
    this.barbell = barbell;
  }

  void changeLight(int light) {
    this.light = light;
  }

  void changeHeavy(int heavy) {
    this.heavy = heavy;
  }

  void changeDescription(String desc) {
    this.desc = desc;
  }

  void increaseByFive(String type) {
    if (type == "light") {
      this.light = this.light + 5;
    } else if (type == "heavy") {
      this.heavy = this.heavy + 5;
    }
  }
  // End change functions

  Map<double, int> getPlatesLight() {

    var plates = new Map();
    int weight = this.light - 45;
    int fortyFive = 0;
    int thirtyFive = 0;
    int twentyFive = 0;
    int ten = 0;
    int five = 0;
    int twoPointFive = 0;

    while (weight >= 0) {
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

    var plates = new Map();
    int weight = this.heavy - 45;
    int fortyFive = 0;
    int thirtyFive = 0;
    int twentyFive = 0;
    int ten = 0;
    int five = 0;
    int twoPointFive = 0;

    while (weight >= 0) {
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
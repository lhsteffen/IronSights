/* lift.dart defines the lift class for IronSights
 *
 * The lift class defines and stores data on each type of
 * lift and is used within the ListList class to create a
 * list of lifts for the user to interact with.
 */

enum Load { work, light, heavy }

class Lift {
  int id = -1;
  String name = "";
  bool barbell = false;
  bool lightHeavySplit = false;
  int? work = -1;
  int? light = -1;
  int? heavy = -1;
  String desc = "";

  Lift.emptyLift();

  Lift.workWeightOnly(this.id, this.name, this.barbell, this.work, this.desc);

  Lift.lightHeavy(this.id, this.name, this.barbell, this.light, this.heavy,
      this.desc) {
    lightHeavySplit = true;
  }

  Lift(this.id, this.name, this.barbell, this.lightHeavySplit, this.work,
      this.light, this.heavy, this.desc);

  // Begin getter functions
  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  bool isLightHeavy() {
    return lightHeavySplit;
  }

  bool isBarbell() {
    return barbell;
  }

  int getWork() {
    return work!;
  }

  int getLight() {
    return light!;
  }

  int getHeavy() {
    return heavy!;
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

  void setLightHeavy(bool lightHeavy) {
    lightHeavySplit = lightHeavy;
  }

  void setWork(int work) {
    this.work = work;
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
      light = light! + 5;
    } else if (type == "heavy") {
      heavy = heavy! + 5;
    } else {
      print("ERROR: Incorrect addition, increaseByFive(String type)");
    }
  }

  // End change functions

  Map<double, int> getPlates(Load load) {
    int? loadWeight = 0;

    switch (load) {
      case Load.work:
        loadWeight = work;

      case Load.light:
        loadWeight = light;

      case Load.heavy:
        loadWeight = heavy;
    }

    final weights = [45.0, 35.0, 25.0, 10.0, 5.0, 2.5];
    double remaining = (loadWeight! - 45) / 2;

    final result = <double, int>{for (final w in weights) w: 0};

    for (final w in weights) {
      final count = (remaining / w).floor();
      if (count > 0) {
        result[w] = count;
        remaining -= count * w;
      }
    }

    return result;
  }
}
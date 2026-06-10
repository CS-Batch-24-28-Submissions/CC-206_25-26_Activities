import 'animal.dart';

class Pet extends Animal {
  String? nickname;
  int kindness;

  //Constructor for Nickname
  Pet(String name, String kingdom, DateTime dob, int numLegs, this.nickname)
    : kindness = 100, // positive starting value
      super(name, kingdom, dob, numLegs);

  //Constructor witout nickname
  Pet.noNickname(String name, String kingdom, DateTime dob, int numLegs)
    : kindness = 0,
      super(name, kingdom, dob, numLegs);

  //Kick method (decreases kindness)
  void kick(int value) {
    kindness -= value;
    print("$name was kicked! Kindness decreased by $value. Current: $kindness");
  }

  //Pet method (increase kindness if >= 0)
  void petAnimal(int value) {
    if (kindness < 0) {
      print("Failed to pet $name. Kindness is too low ($kindness).");
    } else {
      kindness += value;
      print(
        "$name enjoyed the pet! Kindness increased by $value. Current: $kindness",
      );
    }
  }

  //Additional method: Feed (increase kindness)
  void feed(int value) {
    kindness += value;
    print("$name was fed! Kindness increased by $value. Current: $kindness");
  }
}

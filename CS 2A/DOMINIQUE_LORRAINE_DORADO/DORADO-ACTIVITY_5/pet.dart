import 'animal.dart';

// Pet class inherits from Animal class
class Pet extends Animal {
  String? nickname; 
  int kindness;     

  // Named constructor: creates a Pet with a nickname and default kindness of 10
  Pet.withNickname(String name, String kingdom, DateTime dob, int numLegs, this.nickname)
      : kindness = 10, 
        super(name, kingdom, dob, numLegs);

  // Named constructor: creates a Pet without a nickname and default kindness of 0
  Pet.noNickname(String name, String kingdom, DateTime dob, int numLegs)
      : kindness = 0,
        super(name, kingdom, dob, numLegs);

  // Method: decreases kindness when the pet is kicked
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("You kicked ${nickname ?? name}. Kindness decreased by $decreaseValue. Current kindness: $kindness.");
  }

  // Method: increases kindness only if it is not below zero
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("Petting failed. $name’s kindness is too low.");
    } else {
      kindness += increaseValue;
      print("You petted ${nickname ?? name}. Kindness increased by $increaseValue. Current kindness: $kindness.");
    }
  }

  // Method: increases kindness when feeding the pet
  void feed(int increaseValue) {
    kindness += increaseValue;
    print("You fed ${nickname ?? name}. Kindness increased by $increaseValue. Current kindness: $kindness.");
  }

  // Method: decreases kindness when scolding the pet
  void scold(int decreaseValue) {
    kindness -= decreaseValue;
    print("You scolded ${nickname ?? name}. Kindness decreased by $decreaseValue. Current kindness: $kindness.");
  }

  // Method override: extends Animal's displayInfo by adding pet-specific details
  @override
  String displayInfo() {
    String petInfo = super.displayInfo();
    return "$petInfo, Nickname: ${nickname ?? 'N/A'}, Kindness: $kindness.";
  }
}
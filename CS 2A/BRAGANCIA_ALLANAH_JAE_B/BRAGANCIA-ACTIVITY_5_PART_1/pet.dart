// Pet class, extends Animal

import 'animal.dart'; // import Animal class

// CONCEPT 7: Inheritance - Pet gets all Animal properties and methods
class Pet extends Animal {
  String nickname;

  // CONCEPT 8: Private member - only accessible inside this file
  int _kindness;

  // Getter so other files can read _kindness but not change it directly
  int get kindness => _kindness;

  // Constructor 1 - with nickname, kindness starts at 50
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  }) : _kindness = 50,
       super(name, kingdom, dob, numLegs);

  // Constructor 2 - without nickname, kindness starts at 0
  Pet({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  }) : nickname = 'Unknown',
       _kindness = 0,
       super(name, kingdom, dob, numLegs);

  // Decreases kindness by the given amount
  void kick(int amount) {
    _kindness -= amount;
    print(
      '$name was kicked! Kindness decreased by $amount!\nKindness Value: $_kindness\n',
    );
  }

  // Increases kindness only if it's not negative
  void pet(int amount) {
    if (_kindness < 0) {
      print(
        '$name is too upset to be petted right now!\nKindess Value: $_kindness\n',
      );
    } else {
      _kindness += amount;
      print(
        '$name was petted! Kindness increased by $amount!\nKindess Value: $_kindness\n',
      );
    }
  }

  // Feeding increases kindness by 30
  void feed() {
    _kindness += 30;
    print(
      '$name was fed! Kindness increased by 30!\nKindess Value: $_kindness\n',
    );
  }

  // Overrides Animal's displayInfo to also show nickname and kindness
  @override
  String displayInfo() =>
      super.displayInfo() +
      '\nNickname : $nickname'
          '\nKindness : $_kindness';
}

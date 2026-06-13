import 'animal.dart';

// CONCEPT 5: Inheritance (Extending a class)
class Pet extends Animal {
  String? nickname; // Nullable if not provided
  int kindness = 0;

  // CONCEPT 6: Named Constructors
  // Constructor 1: Including nickname (sets kindness to positive)
  Pet.withNickname(String name, String kingdom, String dob, int legs, this.nickname) 
      : super(name, kingdom, dob, legs) {
    kindness = 100; 
  }

  // Constructor 2: Excluding nickname
  Pet.noNickname(String name, String kingdom, String dob, int legs) 
      : super(name, kingdom, dob, legs);

  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print('You kicked $name! Kindness decreased by $decreaseValue. Current: $kindness');
  }

  void pet(int increaseValue) {
    if (kindness < 0) {
      print('Action failed: $name is too upset to be petted right now.');
    } else {
      kindness += increaseValue;
      print('You petted $name! Kindness increased by $increaseValue. Current: $kindness');
    }
  }

  // Custom Method: Feed
  void feed(int foodAmount) {
    kindness += foodAmount;
    print('You fed $name. Kindness increased to $kindness.');
  }
}
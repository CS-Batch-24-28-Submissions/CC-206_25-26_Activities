import 'animal.dart';

// Programming Concept #5: Inheritance (extends Animal)
class Pet extends Animal {
  String? nickname; // Programming Concept #6: Null safety
  int kindness = 0;

  // Programming Concept #7: Named Constructor (requires nickname + positive kindness)
  Pet.withNickname(
      String name, String kingdom, DateTime dob, int numlegs, this.nickname)
      : super(name, kingdom, dob, numlegs) {
    kindness = 100; // Positive starting value as required
  }

  // Programming Concept #8: Default Constructor (no nickname)
  Pet(String name, String kingdom, DateTime dob, int numlegs)
      : super(name, kingdom, dob, numlegs);

  // Programming Concept #9: Method - Kick (decreases kindness)
  void kick(int decreaseBy) {
    kindness -= decreaseBy;
    print("Kicked ${nickname ?? 'the pet'}! Kindness decreased by $decreaseBy. Current: $kindness");
  }

  // Programming Concept #10: Method - Pet (conditional increase)
  void pet(int increaseBy) {
    if (kindness < 0) {
      print("Failed to pet ${nickname ?? 'the pet'}. Kindness is below 0.");
    } else {
      kindness += increaseBy;
      print("Pet ${nickname ?? 'the pet'}! Kindness increased by $increaseBy. Current: $kindness");
    }
  }

  // Extra required method
  void adjustKindness(int value) {
    kindness += value;
    String action = value >= 0 ? "increased" : "decreased";
    int amount = value.abs();
    print("Adjusted kindness for ${nickname ?? 'the pet'}: $action by $amount. Current: $kindness");
  }
}
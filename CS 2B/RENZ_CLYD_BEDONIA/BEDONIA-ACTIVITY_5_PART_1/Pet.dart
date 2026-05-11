// Pet Class

// import Animal class
import 'Animal.dart';

class Pet extends Animal {
  String? nickname;
  int kindnessValue;

  String get displayName => nickname ?? name;

  // Pet constructors

  // Constructor excluding pet nickname
  Pet(super.name, super.kingdom, super.dob, super.numLegs, this.kindnessValue);

  // CONCEPT 10: Named Constructors. A Pet constructor that requires a nickname.
  Pet.requiringNickName(
    super.name,
    super.kingdom,
    super.dob,
    super.numLegs,
    this.nickname,
  ) : kindnessValue = 50;

  // Pet methods

  // Function for kicking pet
  void kick(int value) {
    kindnessValue -= value;
    print(
      "Oh no! Poor $displayName was kicked.\nKindness Value: $kindnessValue\n",
    );
  }

  // Function for petting pet
  void pet(int value) {
    if (kindnessValue > 0) {
      kindnessValue += value;
      print(
        "Awww! $displayName has been petted.\nKindness Value: $kindnessValue\n",
      );
    } else {
      print(
        "$displayName snarled at you, you cannot pet it.\nKindness Value: $kindnessValue\n",
      );
    }
  }

  // Function for playing with pet
  void play(int value) {
    if (kindnessValue > 0) {
      kindnessValue += value;
      print(
        "Awesome! You and $displayName had a great time playing.\nKindness Value: $kindnessValue\n",
      );
    } else {
      print(
        "$displayName does not want to play with you.\nKindness Value: $kindnessValue\n",
      );
    }
  }
}

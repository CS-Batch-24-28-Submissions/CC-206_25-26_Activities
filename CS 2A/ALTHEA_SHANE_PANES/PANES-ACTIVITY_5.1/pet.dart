//Pet Class
//Import the animal.dart to extend the Pet
import 'animal.dart';

//Programming concept Applied: Constructing Class
//Programming concept Applied: Variable Initialization
class Pet extends Animal {
  String? nickname; //Optional
  int kindness = 0;

  //Constructor without nickname
  Pet.withoutNickname(String name, String kingdom, String dob, int numLeg)
    : super(name, kingdom, dob, numLeg) {
    print("A pet has no nickname");
  }

  //Constructor with nickname
  Pet.withNickname(
    String name,
    String kingdom,
    String dob,
    int numLeg,
    this.nickname,
  ) : super(name, kingdom, dob, numLeg) {
    kindness = 10;
    print("Pet name is  $nickname with kindness= $kindness");
  }

  //Kick
  //Programming concept Applied: Multiline String
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("""$nickname was kicked.
    Kindness decreased by: $decreaseValue.
    Current Kindess: $kindness""");
  }

  //Pet
  //Programming concept Applied: Conditionals
  //Programming concept Applied: Multiline String
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("""Petting failed.
      $nickname refuses to interact.""");
    } else {
      kindness += increaseValue;
      print("""You pet $nickname
      Kindness increased by : $increaseValue
      Current Kindness: $kindness""");
    }
  }

  //Bath
  void bath(int increaseValue) {
    kindness += increaseValue;
    print("""$nickname was bathed.
    Kindness increased by: $increaseValue.
    Current Kindness: $kindness""");
  }

  //Programming concept Applied: Multiline String
  @override
  String displayInfo() {
    return """
            Name: $name
            Nickname: $nickname
            Kingdom: $kingdom
            Date of Birth: $dob
            Number of Legs: $numLeg
            Kindness Level: $kindness
            """;
  }
}

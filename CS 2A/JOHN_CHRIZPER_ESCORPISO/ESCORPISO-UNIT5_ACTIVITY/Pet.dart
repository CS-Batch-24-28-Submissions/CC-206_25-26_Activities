import 'Animal.dart';

class Pet extends Animal {
  //--------------------------------------------------Inheritance: Pet class extends Animal class
  String? nickname; //pet's nickname
  int kindness; //pet's kindness level

  Pet(String name, String kingdom, DateTime dob, int numLegs)
    : nickname = null,
      kindness = 0,
      super(name, kingdom, dob, numLegs); //constructor

  Pet.withNickname(
    String name,
    String kingdom,
    DateTime dob,
    int numLegs,
    this.nickname,
  ) : kindness = 10,
      super(name, kingdom, dob, numLegs); //constructor with nickname

  void kick(int value) {
    //kick method to decrease kindness score
    kindness -= value;
    print("You kicked $nickname! Kindness score decreased by $value.");
    print("Current kindness score: $kindness");
  }

  void pet(int value) {
    //pet method to increase kindness score
    if (kindness < 0) {
      print("\n$nickname is too upset to be petted right now. Petting failed.");
    } else {
      kindness += value;
      print("You pet $nickname! Kindness score increased by $value.");
      print("Current kindness score: $kindness");
    }
  }

  void feed(int value) {
    //feed method to increase kindness score
    kindness += value;
    print("You fed $nickname! Kindness score increased by $value.");
    print("Current kindness score: $kindness");
  }
}

void main() {
  Pet dog = Pet.withNickname(
    "Buddy",
    "Mammal",
    DateTime(2015, 5, 20),
    4,
    "Buddy",
  );
  Pet cat = Pet.withNickname(
    "Whiskers",
    "Mammal",
    DateTime(2018, 3, 15),
    4,
    "Whiskers",
  );

  print(dog.displayInfo());
  dog.pet(5);
  dog.feed(3);
  dog.kick(8);

  print("\n-----------------------------\n");

  print(cat.displayInfo());
  cat.pet(4);
  cat.feed(2);
  cat.kick(6);
}

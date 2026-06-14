//Main Function
void main() {
  List<Animal> zoo = [
    //programming concept used: objects
    Animal("Lion", "Mammal", "2018-03-10", 4),
    Animal("Snake", "Reptile", "2020-07-15", 0),
    Animal("Eagle", "Bird", "2019-11-01", 2),
    Animal("Elephant", "Mammal", "2015-05-20", 4),
    Animal("Frog", "Amphibian", "2021-09-12", 4),
  ];

  print("---ZOO---");

  ////programming concept used: for-in loop
  for(Animal a in zoo) {
    a.walk("north");
  }

  List<Pet> PET_HOME = [
    Pet("Buddy"),
    Pet("Mimi"),
    Pet.withoutNickname(35),
  ];

  //programming concept used: indexing

   // Decrease kindness below 0
  PET_HOME[2].kick(10);

  // Increase kindness above 1000
  PET_HOME[0].rub(1000);

  // Increase kindness above 1000
  PET_HOME[1].feed(1200);
}

//1.
////programming concept used: classes
class Animal {
  //Attributes
  String name = "";
  String kingdom = "";
  String dob = "";
  int numLegs = 0;

  //Constructor
  Animal(String name, String kingdom, String dob, int numLegs) {
    this.name = name;
    this.kingdom = kingdom;
    this.dob = dob;
    this.numLegs = numLegs;
  }

  //Methods
  void walk(String direction) {
    print('---WALK FUNCTION---');
    if(this.numLegs == 4) {
      print('The animal called ${this.name} is walking to the ${direction}');
    } else {
      print("It can't walk");
    }
  }
}

//2.
//Class Pet
class Pet {
  //Attributes
  String nickname = "Onyx";
  int kindness = 0;

//First constructor
  Pet(String nickname, [int? kindness]) { //programming concept used: optional parameters
    this.nickname = nickname;
    this.kindness = kindness ?? 50;
  }

//programming concept used: named constructor
  Pet.withoutNickname(int kindness) {
    this.kindness = kindness;
  }

  //Methods
  void kick(int kindness) {
    print('---KICK METHOD---');
    kindness -= 10;
    print("$nickname was kicked kindness decreased by 10");
    print("Pet kindness is now: $kindness");
  }

  void pet(int kindness) {
    print("Pet $nickname on the head");
    //programming concept used: conditional statements
    if(kindness <= 0) {
      print("You have failed to pet $nickname");
    } else {
      kindness += 5;
      print("Pet kindness has increased by 5, Current kindness: $kindness");
    }
  }

  void rub(int kindness) {
      print("rub $nickname on the belly");
      if(kindness <= 0) {
        print("You have failed to rub $nickname\'s on the belly");
      } else {
        kindness += 10;
        print("Pet kindness has increased by 10, Current kindness: $kindness");
      }
    }

  void feed(int kindness) {
    print("feed $nickname kibbles");
      if(kindness <= 0) {
        print("You have failed to feed $nickname");
      } else {
        kindness += 25;
        print("Pet kindness has increased by 25, Current kindness: $kindness");
      }
  }
}
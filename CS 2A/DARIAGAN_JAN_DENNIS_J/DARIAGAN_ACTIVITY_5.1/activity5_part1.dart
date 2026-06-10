// Concept: Class definition
class Animal {
  // Concept: Attributes (fields)
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // Concept: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Concept: Method with parameter
  void walk(String direction) {
    if (numLegs > 0) {
      print('$name is walking towards $direction.');
    } else {
      print('$name can’t walk because it has no legs.');
    }
  }

  // Concept: Method returning a value
  String displayInfo() {
    return 'Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numLegs';
  }
}

// Concept: Inheritance (Pet extends Animal)
class Pet extends Animal {
  String? nickname;
  int kindness;

  // Constructor with nickname
  Pet.withNickname(String name, String kingdom, String dob, int numLegs, this.nickname)
      : kindness = 100,
        super(name, kingdom, dob, numLegs);

  // Constructor without nickname
  Pet.noNickname(String name, String kingdom, String dob, int numLegs)
      : kindness = 0,
        super(name, kingdom, dob, numLegs);

  // Concept: Method modifying state
  void kick(int value) {
    kindness -= value;
    print('${nickname ?? "No Nickname"} was kicked. Kindness is now $kindness.');
  }

  void pet(int value) {
    if (kindness < 0) {
      print('${nickname ?? "No Nickname"} failed to respond positively.');
    } else {
      kindness += value;
      print('${nickname ?? "No Nickname"} is happy. Kindness is now $kindness.');
    }
  }

  // Extra method: feed
  void feed(int value) {
    kindness += value;
    print('${nickname ?? "No Nickname"} was fed. Kindness is now $kindness.');
  }
}

void main() {
  // Concept: List of objects
  List<Animal> zoo = [
    Animal('Elephant', 'Mammal', '2018-04-10', 4),
    Animal('Snake', 'Reptile', '2020-07-15', 0),
    Animal('Eagle', 'Bird', '2019-03-22', 2),
    Animal('Frog', 'Amphibian', '2021-01-05', 4),
    Animal('Shark', 'Fish', '2017-11-30', 0),
  ];

  print('=== ZOO ===');
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk('north');
  }

  // Concept: List of Pet objects
  List<Pet> petHome = [
    Pet.withNickname('Dog', 'Mammal', '2022-02-14', 4, 'Buddy'),
    Pet.noNickname('Cat', 'Mammal', '2021-05-10', 4),
    Pet.withNickname('Parrot', 'Bird', '2020-09-01', 2, 'Coco'),
  ];

  print('\n=== PET HOME ===');
  petHome[0].kick(50); // decrease kindness below 0
  petHome[1].kick(30); // decrease kindness below 0
  petHome[2].pet(1200); // increase kindness above 1000
  petHome[0].feed(50); // feed Buddy
  petHome[1].pet(20);  // try petting Cat
}

/*
  Name: Ralph Anthony Colada
  CC 206 - Unit 5 Part 1 Activity
  Date: 4/16/2027

  This is a program that demonstrates the concepts of classes, inheritance, and method overriding in Dart.
*/ 

// CONCEPT 1:
// Defining a class (Animal)
class Animal {

  // CONCEPT 2:
  // Attributes (Instance Variables)
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // CONCEPT 3:
  // Constructor (Animal)
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // CONCEPT 4:
  // Method with parameter (walk)
  void walk(String direction) {
    // CONCEPT 5:
    // Conditional logic (if-else)
    if (numlegs == 0) {
      print('$name cannot walk because it has no legs.');
    } else {
      print('$name is walking towards $direction.');
    }
  }

  // CONCEPT 6:
  // Return type and String interpolation (displayInfo)
  String displayInfo() {
    return 'Name: $name, Kingdom: $kingdom, Date of Birth: $dob, Number of Legs: $numlegs';
  }
}

// CONCEPT 7:
// Inheritance (Pet extends Animal)
class Pet extends Animal {

  String nickname;
  int kindness;

  // Constructor with nickname (kindness starts at 5)
  Pet.withNickname(String name, String kingdom, String dob, int numlegs, this.nickname)
      : kindness = 5,
        super(name, kingdom, dob, numlegs);

  // Constructor without nickname (kindness starts at 0)
  Pet.noNickname(String name, String kingdom, String dob, int numlegs)
      : nickname = name,
        kindness = 0,
        super(name, kingdom, dob, numlegs);

  void kick() {
    kindness = kindness - 3;
    print('You kicked $nickname... kindness is now $kindness');
  }

  void pet() {
    if (kindness < 0) {
      print('$nickname is unhappy and does not want to be petted right now.');
    } else {
      kindness = kindness + 5;
      print('You petted $nickname! kindness is now $kindness');
    }
  }

  // Feed method (gives food to increase kindness)
  void feed() {
    kindness = kindness + 25;
    print('You gave $nickname some food. kindness is now $kindness');
  }
}

void main() {

  // CONCEPT 8:
  // Collection of objects (List)
  List<Animal> ZOO = [
      Animal('Capybara', 'Mammalia', '2019-04-10', 4),
      Animal('Axolotl', 'Amphibia', '2020-07-22', 4),
      Animal('Blobfish', 'Pisces', '2021-01-15', 0),
      Animal('Quokka', 'Mammalia', '2018-09-05', 4),
      Animal('Naked Mole Rat', 'Mammalia', '2022-03-30', 4),
  ];

  print('--- ZOO ---');

  // CONCEPT 9:
  // Iteration (for loop)
  for (int i = 0; i < ZOO.length; i++) {
    print(ZOO[i].displayInfo());
    ZOO[i].walk('forward');
    print('');
  }

  List<Pet> PET_HOME = [
    Pet.withNickname('Buddy', 'Mammalia', '2021-06-12', 4, 'Bud'),
    Pet.noNickname('Whiskers', 'Mammalia', '2020-11-03', 4),
    Pet.withNickname('Tweety', 'Aves', '2022-02-18', 2, 'Tweet'),
  ];

  print('--- PET HOME ---');

  // Decrease kindness of Bud and Whiskers below 0
  // Bud starts at 5, kick 3 times (5 - 9 = -4)
  PET_HOME[0].kick();
  PET_HOME[0].kick();
  PET_HOME[0].kick();

  // Whiskers starts at 0, kick once (0 - 3 = -3)
  PET_HOME[1].kick();

  print('');

  // try to pet them now that kindness is below 0
  PET_HOME[0].pet();
  PET_HOME[1].pet();

  print('');

  // Increase kindness of Tweety above 1000
  // Starts at 5, each feed adds 25 so 40 feeds (5 + 1000 = 1005)
  for (int i = 0; i < 40; i++) {
    PET_HOME[2].feed();
  }

  print('');
  print('--- Final Kindness Values ---');
  // CONCEPT 10:
  // Iteration (for-each loop)
  for (var p in PET_HOME) {
    print('${p.nickname}: ${p.kindness}');
  }
}

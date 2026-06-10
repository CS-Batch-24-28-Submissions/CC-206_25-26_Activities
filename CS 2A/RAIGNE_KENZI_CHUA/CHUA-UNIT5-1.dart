// Class
class Animal {
  // Attributes
  final String name;
  final String kingdom;
  final String dob;
  final int numLegs;

  // Constructor
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  
  void walk(String direction) {
    // Conditional
    if (numLegs == 0) {
      print('$name cannot walk because it has no legs.');
      return;
    }
    
    print('$name is walking $direction');
  }

  String displayInfo() {
    // Multi-line String
    return '''
Name: $name
Kingdom: $kingdom
Date of Birth: $dob
Number of Legs: $numLegs
''';
  }
}

// Class
class Pet extends Animal {
  
  String? nickname;
  int kindness = 0;

  Pet(String name, String kingdom, String dob, int numLegs, this.nickname, {this.kindness = 10}) : super(name, kingdom, dob, numLegs);
  
  // Named Constructor
  Pet.noNick(String name, String kingdom, String dob, int numLegs) : super(name, kingdom, dob, numLegs);


  void kick(int value) {
    kindness -= value;
    print('${nickname ?? name} has been kicked! Kindness is now $kindness.');
  }

  void pet(int value) {
    if (kindness < 0) {
      print('${nickname ?? name} is too upset to be petted right now.');
      return;
    }
    
    kindness += value;
    print('${nickname ?? name} has been petted! Kindness is now $kindness.');

  }

  void feed(int value) {
    kindness += value;
    print('${nickname ?? name} has been fed! Kindness is now $kindness.');
  }
}

void main() {
  // List
  final List<Animal> ZOO = [
    Animal('Monkey', 'Mammalia', '5/21/06', 2),
    Animal('Iguana', 'Reptilia', '5/1/18', 4),
    Animal('Shark', 'Pisces', '3/23/25', 0),
    Animal('Crab', 'Arachnida', '3/1/26', 8),
    Animal('Hawk', 'Aves', '2/15/26', 2)
  ];

  final List<Pet> PET_HOME = [
    Pet('Dog', 'Mammalia', '1/1/20', 4, 'Tung'),
    Pet('Cat', 'Mammalia', '2/2/19', 4, 'Assassino'),
    Pet.noNick('Parrot', 'Aves', '3/3/18', 2)
  ];

  print('--- ZOO ANIMALS ---');
  // Loop
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('forward');
    print('---');
  }

  print('--- PETS ---');

  PET_HOME[0].kick(15);
  PET_HOME[0].pet(5);
  PET_HOME[1].pet(1000);
  PET_HOME[2].feed(9000);
}
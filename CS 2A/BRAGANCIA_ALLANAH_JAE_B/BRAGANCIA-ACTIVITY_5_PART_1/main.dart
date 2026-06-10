import 'animal.dart'; // import Animal class
import 'pet.dart'; // import Pet class

void main() {
  // === ZOO ===

  // CONCEPT 9: List - stores multiple Animal objects
  //Concept 10: Using target-typed 'new' for shorter object creation
  List<Animal> zoo = [
    Animal('Bird', 'Aves', DateTime(2019, 3, 15), 2),
    Animal('Dog', 'Mammalia', DateTime(2018, 7, 22), 4),
    Animal('Python', 'Reptilia', DateTime(2020, 1, 10), 0),
    Animal('Dolphin', 'Mammalia', DateTime(2017, 5, 30), 0),
    Animal.withoutDob(name: 'Tarantula', kingdom: 'Arachnida', numLegs: 8),
  ];

  _printHeader(' ZOO : Animal WonderLand');

  // Loop through each animal and show info and walk
  for (Animal animal in zoo) {
    print(animal.displayInfo());
    animal.walk('North');
    print('');
  }

  // === The PET HOME ===

  List<Pet> petHome = [
    Pet.withNickname(
      name: 'Goliath',
      kingdom: 'Mammalia',
      dob: DateTime(2021, 11, 23),
      numLegs: 4,
      nickname: 'Goli',
    ),
    Pet.withNickname(
      name: 'Buddy',
      kingdom: 'Mammalia',
      dob: DateTime(2022, 8, 3),
      numLegs: 4,
      nickname: 'Budd',
    ),
    Pet(
      name: 'David',
      kingdom: 'Reptilia',
      dob: DateTime(2020, 11, 20),
      numLegs: 4,
    ),
  ];

  _printHeader('PET HOME : Where Pets Rule');
  for (Pet p in petHome) {
    print(p.displayInfo());
    print('');
  }

  // Decrease kindness
  _printHeader('      Kicking Pets ');
  petHome[1].kick(200);
  petHome[2].kick(300);
  print('');

  // Increase kindness
  _printHeader('  Petting & Feeding Pets');
  for (int i = 0; i < 15; i++) {
    petHome[0].pet(90);
  }
  print('');

  // David is upset so pet() fails; feed() raises it a little
  petHome[2].feed();
  petHome[2].feed();
  petHome[2].pet(50);
  print('');

  // Final summary
  _printHeader('Pets Final Kindness Summary');
  for (var p in petHome) {
    print('${p.name} (${p.nickname}) = Kindness: ${p.kindness}');
  }
}

// Helper to print a section header
void _printHeader(String title) {
  final line = '═' * 40;
  print('\n$line');
  print('       $title');
  print('$line');
}

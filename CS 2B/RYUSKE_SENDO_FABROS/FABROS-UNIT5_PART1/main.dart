import 'Animal.dart';
import 'pet.dart';

// 1. concept: Entry point
void main() {
  // 2. concept: Data Types
  // 3. concept: Lists and Arrays
  List<Animal> ZOO = [
    Animal('Capybara', 'Animalia', '2015-05-10', 4),
    Animal('T-Rex', 'Animalia', '2018-03-22', 2),
    Animal('Mammoth', 'Animalia', '2020-07-15', 4),
    Animal('Dodo', 'Animalia', '2010-11-25', 2),
    Animal('Blobfish', 'Animalia', '2019-01-12', 0),
  ];

  print('--- ZOO ANIMALS ---');
  // 5. concept: Looping
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('North');
    print('-------------------');
  }

  List<Pet> PET_HOME = [
    Pet('Velociraptor', 'Animalia', '2021-01-01', 2, 'Snuggles'),
    Pet('Megalodon', 'Animalia', '2022-05-05', 0, 'Cupcake'),
    Pet.noNickname('Tarantula', 'Animalia', '2023-10-10', 8),
  ];

  print('\n\n--- PET HOME ---');

  // Decrease the kindness value below 0
  print('\nInteracting with Snuggles:');
  PET_HOME[0].kick(30);
  PET_HOME[0].kick(30); // 30 - 30 - 30 = -30
  PET_HOME[0].pet(30); // fail

  // Increase the kindness value above 1000.
  print('\nInteracting with Cupcake:');
  PET_HOME[1].feed(1500); // 30 + 1500 = 1530

  print('\nFinal pet status check:');
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }
}

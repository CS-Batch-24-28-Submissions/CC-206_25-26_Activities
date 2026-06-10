import 'animal.dart';
import 'pet.dart';

void main() {
  // CU: Lists (Arrays)
  List<Animal> zoo = [
    Animal('Leo', 'Mammal', '2022-05-10', 4),
    Animal('Slither', 'Reptile', '2023-01-15', 0),
    Animal('Bubbles', 'Fish', '2024-02-20', 0),
    Animal('Polly', 'Bird', '2021-11-05', 2),
    Animal('Hoppy', 'Amphibian', '2025-03-01', 4),
  ];

  print('--- ZOO ACTIVITIES ---');
  // CU: Looping (Iterating through the list)
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk('East');
    print('--------------------');
  }

  print('\n--- PET HOME ACTIVITIES ---');
  List<Pet> petHome = [
    Pet.withNickname('Dog', 'Mammal', '2020-01-01', 4, 'Buddy'),
    Pet.noNickname('Cat', 'Mammal', '2021-06-12', 4),
  ];

  // Decrease kindness below 0 (negative)
  petHome[1].kick(50);
  petHome[1].pet(10); // Should fail because kindness is < 0

  // Increase kindness above 1000
  // CU: Cascading Operator
  petHome[0]
    ..feed(500)
    ..pet(500);

  print('Final Kindness of ${petHome[0].name}: ${petHome[0].kindness}');
}
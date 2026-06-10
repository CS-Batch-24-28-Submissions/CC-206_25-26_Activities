import 'animal.dart';
import 'pet.dart';

void main() {
  // Concept: List and Arrays
  List<Animal> zoo = [
    Animal('Lion', 'Animalia', '2020-05-12', 4),
    Animal('Snake', 'Animalia', '2022-01-10', 0),
    Animal('Eagle', 'Animalia', '2019-08-15', 2),
    Animal('Gold Fish', 'Animalia', '2023-03-22', 0),
    Animal('Elephant', 'Animalia', '2015-11-30', 4),
  ];

  print('< --- ZOO ANIMALS --- >');
  // Concept: Looping
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk('North');
  }

  List<Pet> petHome = [
    Pet.withNickname('Doggo', 'Mammal', '2021-06-01', 4, 'Buddy'),
    Pet.withoutNickname('Kitty', 'Mammal', '2022-02-14', 4),
  ];

  print('\n < --- PET HOME INTERACTIONS --- >');
  
  // Decrease kindness below 0.
  petHome[0].kick(20); 
  petHome[0].petAnimal(5); // should fail because kindness is < 0.

  // Increase kindness above 1000.
  petHome[1].giveTreat(1500); 
  print('Final Kindness of ${petHome[1].name}: ${petHome[1].kindness}');
}
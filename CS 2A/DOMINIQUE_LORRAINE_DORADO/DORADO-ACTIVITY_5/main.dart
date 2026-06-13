import 'animal.dart';
import 'pet.dart';

void main() {
  // List of Animal objects 
  List<Animal> ZOO = [
    Animal("Lion", "Mammal", DateTime(2020, 5, 10), 4),
    Animal("Snake", "Reptile", DateTime(2021, 3, 15), 0),
    Animal("Eagle", "Bird", DateTime(2019, 8, 20), 2),
    Animal("Frog", "Amphibian", DateTime(2022, 1, 5), 4),
    Animal("Shark", "Fish", DateTime(2018, 11, 30), 0),
  ];

  // Iterates through each Animal and calls its methods 
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
  }

  print("\n--- PET HOME ---");

  // List of Pet objects 
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammal", DateTime(2021, 6, 1), 4, "Tote"),
    Pet.noNickname("Parrot", "Bird", DateTime(2020, 7, 12), 4),
    Pet.withNickname("Cat", "Mammal", DateTime(2022, 2, 14), 2, "Skyper"),
  ];

  // Method calls: demonstrate behavior changes affecting 'kindness'
  PET_HOME[0].kick(15); 
  PET_HOME[1].kick(5);  
  PET_HOME[2].feed(1200); 

  // Displays updated pet information after interactions
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }
}
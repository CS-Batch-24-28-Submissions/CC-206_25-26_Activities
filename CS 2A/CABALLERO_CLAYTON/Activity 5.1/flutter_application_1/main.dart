import 'Animal.dart';
import 'Pet.dart';

void main() {
  // ZOO list (5 Animals)
  List<Animal> ZOO = [
    Animal("Lion", "Mammal", DateTime(2020, 5, 10), 4),
    Animal("Snake", "Reptile", DateTime(2019, 3, 15), 0),
    Animal("Frog", "Amphibian", DateTime(2021, 7, 20), 4),
    Animal("Bird", "Aves", DateTime(2022, 1, 5), 2),
    Animal("Fish", "Aquatic", DateTime(2023, 6, 30), 0),
  ];

  print("=== ZOO ===");
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
    print("");
  }

  // PET_HOME list (2–3 Pets)
  List<Pet> PET_HOME = [
    Pet("Dog", "Mammal", DateTime(2021, 4, 1), 4, "Buddy"),
    Pet.noNickname("Cat", "Mammal", DateTime(2020, 8, 12), 4),
    Pet("Parrot", "Bird", DateTime(2022, 2, 2), 2, "Kiwi"),
  ];

  print("=== PET HOME ===");

  // Decrease kindness below 0
  PET_HOME[0].kick(200); // likely negative
  PET_HOME[1].kick(50);

  // Increase kindness above 1000
  PET_HOME[2].feed(1200);
  PET_HOME[2].petAnimal(500);

  // Try petting a negative kindness pet
  PET_HOME[0].petAnimal(50);
}

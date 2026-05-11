import 'animal.dart';
import 'pet.dart';

void main() {
  // ZOO list - 5 different Animal objects
  List<Animal> ZOO = [
    Animal("Lion", "Animalia", DateTime(2020, 5, 15), 4),
    Animal("Snake", "Animalia", DateTime(2019, 8, 22), 0),
    Animal("Eagle", "Animalia", DateTime(2021, 3, 10), 2),
    Animal("Elephant", "Animalia", DateTime(2018, 11, 5), 4),
    Animal("Spider", "Animalia", DateTime(2022, 1, 30), 8),
  ];

  print("=== ZOO ANIMALS ===");
  // Iterate through ZOO and call each function
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("forward");
    animal.walk("left");
  }

  // PET_HOME list - 3 different Pet objects
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Animalia", DateTime(2023, 6, 15), 4, "Doggie"),
    Pet("Cat", "Animalia", DateTime(2024, 2, 10), 4),
    Pet.withNickname("Rabbit", "Animalia", DateTime(2022, 12, 5), 4, "White Rabbit"),
  ];

  print("\n=== PET_HOME (before actions) ===");
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print("Nickname: ${pet.nickname ?? 'None'} | Kindness: ${pet.kindness}");
  }

  print("\n=== KINDNESS ACTIONS ===");
  // Decrease kindness of 2 pets below 0
  print("Decreasing kindness of 1-2 pets below 0:");
  PET_HOME[0].kick(150);   // Doggie → -50
  PET_HOME[1].adjustKindness(-50); // Cat → -50

  // Increase kindness of 2 pets above 1000
  print("\nIncreasing kindness of 1-2 pets above 1000:");
  PET_HOME[2].pet(1100);           // White Rabbit → 1200
  PET_HOME[0].adjustKindness(1300); // Doggie → 1250

  print("\n=== FINAL PET STATUS ===");
  for (var pet in PET_HOME) {
    print("${pet.nickname ?? 'Unnamed Pet'} - Kindness: ${pet.kindness}");
  }

  print("\nActivity completed! All requirements met.");
}
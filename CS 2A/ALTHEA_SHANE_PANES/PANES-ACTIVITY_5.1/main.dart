import 'animal.dart';
import 'pet.dart';

void main() {
  //Programming concept Applied: List Initialization
  List<Animal> ZOO = [
    Animal("Maya", "Birds", "01/02/2013", 2),
    Animal("Tarsier", "Mammals", "03/04/2021", 4),
    Animal("Snake", "Reptiles", "05/12/2019", 0),
    Animal("Frog", "Amphibians", "12/21/2016", 4),
    Animal("Crocodile", "Reptile", "08/07/2024", 4),
  ];

  //Programming concept Applied: Looping
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
  }

  //Programming concept Applied: List Initialization
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammals", "01/06/2021", 2, "Choco"),
    Pet.withNickname("Cat", "Mammals", "03/26/2026", 2, "Margaret"),
    Pet.withoutNickname("Goldfish", "Fish", "01/23/2025", 0),
  ];
  //Decrease the kindness value of 1-2 pets below 0 (negative values)
  PET_HOME[0].kick(12);
  PET_HOME[1].kick(20);

  //Increase the kindness value of 1-2 pets  above 1000.
  PET_HOME[1].pet(1500);
  PET_HOME[2].pet(2000);

  //Display info of pet
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }
}

//Summary of Programming Concepts Applied in three dart files
// 1. Constructing Class
// 2. Variable Initialization
// 3. Constructor Shorthand
// 4. Conditionals
// 5. Multiline Strings
// 6. Inheritance 
// 7. Looping / Iteration
// 8. List and Array


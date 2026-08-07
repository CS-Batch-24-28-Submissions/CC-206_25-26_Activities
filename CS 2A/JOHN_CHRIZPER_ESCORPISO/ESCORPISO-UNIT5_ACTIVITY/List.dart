import 'Pet.dart';
import 'Animal.dart';

//========================================
//      Dart programming concepts
//========================================
//Entry poin is main()
//Data types like int, String DateTime
//Conditional statements like if-else
//Constructors and methods in classes
//Lists to store multiple objects
//Use of this. keyword
//Inheritance with Pet class extending Animal class
//-------------------------------------------------------
void main() {
  //--------------------------------------------------------------Entry point of the program
  List<Animal> ZOO = [
    //----------------------------------------------------List to store multiple Animal objects
    Animal("Pig", "Mammal", DateTime(2010, 4, 15), 4),
    Animal("Eagle", "Bird", DateTime(2019, 3, 20), 2),
    Animal("Snake", "Reptile", DateTime(2020, 7, 15), 0),
    Animal("Frog", "Amphibian", DateTime(2021, 1, 5), 4),
    Animal("Shark", "Fish", DateTime(2017, 9, 12), 0),
  ];

  for (Animal animal in ZOO) {
    //--------------------------------------------------Loop through each animal in the ZOO list
    print(animal.displayInfo());
    animal.walk("forward");
    print("\n-----------------------------\n");
  }

  List<Pet> PET_HOME = [
    Pet.withNickname("Charlie", "Mammal", DateTime(2016, 2, 10), 4, "Charlie"),
    Pet.withNickname("Luna", "Mammal", DateTime(2018, 11, 5), 4, "Luna"),
    Pet.withNickname("Max", "Mammal", DateTime(2017, 6, 25), 4, "Max"),
  ];

  PET_HOME[0].kick(50);
  PET_HOME[1].kick(20);

  print("\n-----------------------------\n");

  PET_HOME[0].feed(1200);
  PET_HOME[2].feed(1350);

  print("\nFINAL PET SCORES: \N");
  for (Pet pet in PET_HOME) {
    print("${pet.nickname}: Kindness Score = ${pet.kindness}");
  }
}

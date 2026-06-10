
import 'Animal.dart';
import 'Pet.dart';



void main() {
  //Array Lists
  List<Animal> ZOO = [
    Animal("Elephant", "Animalia", "04/01/2000", 4),
    Animal("StingRay", "Animalia", "01/26/2010", 0),
    Animal("Monkey", "Animalia", "09/29/2015", 2),
    Animal("Axolotl", "Animalia", "09/09/2005", 4),
    Animal("Sloth", "Animalia", "12/25/2014", 2),

  ];
  //Loops
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("left");
    print("\n");
  };

  
  List<Pet> PET_HOME = [
    Pet.WithNickname("Sloth", "Animalia", "09/29/2015", 2, "Adrian"),
    Pet.withoutNickname("Axolotl", "Animalia", "09/09/2005", 4),
    Pet.withoutNickname("StingRay", "Animalia", "01/26/2010", 0),
  ];


  PET_HOME[1].kick();
  PET_HOME[2].kick();

  PET_HOME[0].feed();









}
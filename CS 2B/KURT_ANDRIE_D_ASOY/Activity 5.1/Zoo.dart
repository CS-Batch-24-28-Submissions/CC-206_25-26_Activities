import 'Animal.dart';
import 'Pet.dart';

List<Pet> PETS = [
  Pet(nickname: "Doggo", name: "Dog", kingdom: "Animalia", dob: "January 1, 2023", numlegs: 4),
  Pet(nickname: "Fishy", name: "Fish", kingdom: "Animalia", dob: "February 1, 2023", numlegs: 0),
  Pet(nickname: "Hammy", name: "Hamster", kingdom: "Animalia", dob: "March 1, 2023", numlegs: 4)
];

List<Animal> ZOO = [
  Animal(
    name: "Kuring",
    kingdom: "Animalia",
    dob: "January 2, 2020",
    numlegs: 4,
  ),
  Animal(
    name: "Fishda",
    kingdom: "Animalia",
    dob: "February 3, 2020",
    numlegs: 0,
  ),
  Animal(
    name: "Eynimal",
    kingdom: "Animalia",
    dob: "March 4, 2020",
    numlegs: 4,
  ),
  Animal(
    name: "DragonFly",
    kingdom: "Animalia",
    dob: "April 5, 2020",
    numlegs: 4,
  ),
  Animal(
    name: "George",
    kingdom: "Insecta",
    dob: "June 7, 2020",
    numlegs: 6,
  )
];

void main() {
   // CONCEPT: For loop
  for (var animal in ZOO) {
    animal.walk("forward");
    print(animal.displayInfo());
  }

  // CONCEPT: For loop with index iteration
  for (var pet in PETS) {
    if (pet == PETS[0]) {
      pet.kick();
      print(pet.displayInfo());
    } else if (pet == PETS[1]) {
      pet.shot();
      print(pet.displayInfo());
    } else if (pet == PETS[2]) {
      // CONCEPT: For loop
      for (int i = 0; i < 501; i++) {
        pet.pet();
      }
      print(pet.displayInfo());

    }
  }
}
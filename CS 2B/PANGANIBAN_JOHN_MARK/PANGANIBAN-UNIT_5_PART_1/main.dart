import 'animal.dart';
import 'pet.dart';

void main() {
  // Animal and Pet information are stored in the builder classes
  final List<Animal> ZOO = AnimalBuilder().buildFiveAnimals();
  final List<Pet> PET_HOME = PetBuilder().buildThreePets();

  // CONCEPT USED (CU): Looping
  for (Animal animal in ZOO) {
    animal.walk(Direction.north);
    print(animal.displayInfo());
  }

  // Decrease kindness to negative
  Pet pet1 = PET_HOME[0];
  pet1.checkKindness(); // 500
  pet1.kick(times: 6); // -100*6 = -600
  pet1.checkKindness(); // -100

  print('\n'); // line break

  // Increase kindness over 1000
  Pet pet2 = PET_HOME[1];
  pet2.checkKindness(); // 0
  pet2.feed(Food.meat, times: 3); // 500*3 = 1500
  pet2.checkKindness(); // 1500
}
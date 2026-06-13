// import classes
import 'Animal.dart';
import 'Pet.dart';

// CONCEPT 1: Entry Point. Every app must have a top-level main() function, which is the entry point to the app.
void main() {
  // -- The Zoo --

  // CONCEPT 2: Lists and Arrays. Using Lists to hold multiple objects.
  // CONCEPT 3: No more "this" and that. Did not use of the new keyword when instantiating the Animal class (e.g., Animal(...) instead of new Animal(...)).
  List<Animal> ZOO = [
    Animal("Barbary Lion", "Chordate", "2010", 4),
    Animal("Red-Eyed Tree Frog", "Chordate", "2019", 4),
    Animal("Giant Pacific Octopus", "Mollusk", "2015", 8),
    Animal("Giant Clam", "Mollusk", "2022", 0),
    Animal("Portuguese Man O' War", "Cnidarian", "2023", 0),
  ];

  // Zoo iteration
  print("=== Welcome to the Zoo ===\n");

  // CONCEPT 4: Looping. Using a for loop to iterate through the Zoo data.
  print("This zoo is filled with diverse creatures!\n");
  for (Animal currentAnimal in ZOO) {
    currentAnimal.displayInfo();
  }

  print("\nWow! the animals started moving!\n");

  for (Animal currentAnimal in ZOO) {
    currentAnimal.walk("forward");
  }

  // -- The Pet Home --

  // Pet Home list
  List<Pet> PET_HOME = [
    // Using the default constructor
    Pet("Bulldog", "Chordate", "2019", 4, 10),

    // Using the named constructor
    Pet.requiringNickName("Bulldog", "Chordate", "2021", 4, "Grumpy"),

    Pet.requiringNickName("Cat", "Chordate", "2023", 4, "Mittens"),
  ];

  // Decreasing the kindness value of Grumpy
  print("\n=== Welcome to the Pet Home ===\n");

  // Decreasing the kindness value of Grumpy
  print("=== Decreasing Kindness ===\n");
  PET_HOME[0].kick(50);

  // Increasing the kindness value of Grumpy and Mittens
  print("=== Increasing Kindness ===\n");
  PET_HOME[1].pet(1100);
  PET_HOME[2].play(1400);
}

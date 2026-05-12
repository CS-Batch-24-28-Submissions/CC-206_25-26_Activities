import "animal.dart";
import "pet.dart";

// ========== [ SANTOS - Activity 5.1 ] ==========

void main() {
  // a. ZOO list - contains 5 animals
  // CONCEPT #7: Lists and Arrays
  List<Animal> ZOO = [
    Animal(name: 'Penguin', kingdom: 'Animalia', dob: '2016-04-12', numLegs: 2),
    Animal(name: 'Shark', kingdom: 'Animalia', dob: '2014-08-30', numLegs: 0),
    Animal(name: 'Otter', kingdom: 'Animalia', dob: '2019-01-25', numLegs: 4),
    Animal(name: 'Tiger', kingdom: 'Animalia', dob: '2017-11-05', numLegs: 4),
    Animal(
      name: 'Polar Bear',
      kingdom: 'Animalia',
      dob: '2013-02-18',
      numLegs: 4,
    ),
  ];

  // Iterate ZOO call functions
  print("====== [ DISPLAYING: List of animals in ZOO: ] ====== \n");

  //  CONCEPT #8: Looping
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('forward');
    print('---------------------------------------------');
  }

  // b. PET_HOME list - contains 3 pets
  List<Pet> PET_HOME = [
    Pet.withNickname(
      name: 'Lion',
      kingdom: 'Animalia',
      dob: '2019-06-15',
      numLegs: 4,
      nickname: 'Simba',
    ),
    Pet.noNickname(
      name: 'Giraffe',
      kingdom: 'Animalia',
      dob: '2020-03-01',
      numLegs: 4,
    ),
    Pet.withNickname(
      name: 'Zebra',
      kingdom: 'Animalia',
      dob: '2021-01-10',
      numLegs: 4,
      nickname: 'Marty',
    ),
  ];

  // INCREASE / DECREASE DEMO
  print("====== [ DEMONSTRATION: Increase/Decrease Kindness Level ] ====== \n");

  // Decrease kindness of 1-2 pets below 0
  print(
    "1. kick(int value) - kicking pets to decrease kindness of 1-2 pets below 0 \n",
  );
  PET_HOME[0].kick(10);
  PET_HOME[1].kick(30);
  print(""); //space

  // Increase kindness of 1-2 pets above 1000
  print(
    "2. petAnimal(int value) - petting the pets to increase kindness of 1-2 pets above 1000 \n",
  );
  PET_HOME[0].petAnimal(2000);
  PET_HOME[2].petAnimal(99999);
  print(""); //space

  // Other: feed to increase by 20 (fixed)
  print("3. feed() - increase kindness by 20 (fixed) \n");
  PET_HOME[1].feed();
  PET_HOME[2].feed();
  print(""); //space

  // Other: yell to decrease by 20 (fixed)
  print("4. yell() - decrease kindness by 20 (fixed) \n");
  PET_HOME[1].feed();
  PET_HOME[2].feed();
  print(""); //space

  // Print PET_HOME info
  print("====== [ DISPLAYING: List of pets in PET_HOME: ] ====== \n");

  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print('---------------------------------------------');
  }
}

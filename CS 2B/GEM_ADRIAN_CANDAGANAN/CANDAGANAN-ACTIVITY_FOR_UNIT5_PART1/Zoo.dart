//Gem Adrian C. Candaganan BSCS 2B AI

//1. CONCEPT: Inheritance
import 'Animal.dart';
import 'Pet.dart';

//2. CONCEPT: Entry Point
main() {
  // 3. CONCEPT: Avoiding 'new' keyword
  Animal seaLion = Animal('Sea Lion', 'Mammalia', DateTime(2020, 1, 15), 0);
  Animal bird = Animal('Bird', 'Aves', DateTime(2023, 3, 10), 2);
  Animal snake = Animal('Snake', 'Reptilia', DateTime(2022, 10, 5), 0);
  Animal elephant = Animal('Elephant', 'Mammalia', DateTime(2015, 8, 20), 4);
  Animal frog = Animal('Frog', 'Amphibia', DateTime(2023, 12, 1), 4);

  // 4. CONCEPT: Lists
  List<Animal> zoo = [seaLion, bird, snake, elephant, frog];

  // 5. CONCEPT: Looping
  print("---Animals---");
  //6. CONCEPT: Accessing List members
  for (int i = 0; i < zoo.length; i++) {
    print('Animal no. ${i + 1}');
    zoo[i].walk('Right');
    print(zoo[i].displayInfo());
  }

  //7. CONCEPT: Named Constructors
  Pet dog = Pet.withNickname(
    'Dog',
    'Mammalia',
    DateTime(2021, 5, 12),
    4,
    'Budd',
  );
  Pet cat = Pet.withNickname(
    'Cat',
    'Mammalia',
    DateTime(2022, 8, 20),
    4,
    'Oreo',
  );
  Pet fish = Pet.withNoNickname(
    'Fish',
    'Actinopterygii',
    DateTime(2024, 6, 1),
    0,
  );

  List<Pet> PET_HOME = [dog, cat, fish];

  print("---Pets---");

  //8. CONCEPT: Methods (Behavior)

  //since the dog has a nickname and its kindness is automatically set to 10, kicking it and decreasing 20 would bring its value below 0 or negative.
  dog.kick(20);
  dog.pet(10);

  cat.pet(20);
  cat.ignored(10);

  //the fish has no nickname, meaning it starts at 0. since my personal method of feed increase the kindness, this will bring the kindness above 1000.
  fish.feed(1500);
  fish.ignored(10);

  print('---Pet\'s Kindness Status---');
  for (var pet in PET_HOME) {
    print('${pet.nickName ?? pet.name} | Kindness  = ${pet.kindness}');
  }
  print('----------------------------');
}

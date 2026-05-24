import 'dart:math';

// Concept: class, constructor, methods, conditionals
class Animal {
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  void walk(String direction) {
    if (numLegs <= 0) {
      print('$name has no legs and can\'t walk.');
    } else {
      print('$name is walking to the $direction.');
    }
  }

  String displayInfo() {
    String formattedDate = "${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}";
    return '--- Animal Info ---\nName: $name\nKingdom: $kingdom\nDOB: $formattedDate\nLegs: $numLegs\n-------------------';
  }
}

// Concept: inheritance, constructor overloading, null safety, method reuse
class Pet extends Animal {
  String? nickname;
  int kindness = 0;

  Pet.withNickname({
    required this.nickname,
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  }) : super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs) {
    kindness = 50;
  }

  Pet.withoutNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  }) : super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs) {
    nickname = "No Nickname";
    kindness = 0;
  }

  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print('Ouch! You kicked $nickname ($name). Kindness decreased by $decreaseValue. Current Kindness: $kindness');
  }

  void pet(int increaseValue) {
    if (kindness < 0) {
      print('Action Failed: $nickname is too upset or scared to let you pet them right now! (Kindness is below 0: $kindness)');
    } else {
      kindness += increaseValue;
      print('You petted $nickname. Kindness increased by $increaseValue. Current Kindness: $kindness');
    }
  }

  void feedTreat(int treatQuality) {
    int increaseValue = treatQuality * 10;
    kindness += increaseValue;
    print('You gave a delicious treat to $nickname! Kindness skyrocketed by $increaseValue. Current Kindness: $kindness');
  }
}

void main() {
  // Concept: list, loop, object creation, method invocation, output
  final random = Random();
  final directions = ['North', 'South', 'East', 'West'];

  print('================== PART 1 & 3a: ZOO ANIMALS ==================\n');

  List<Animal> ZOO = [
    Animal(name: 'Lion', kingdom: 'Mammalia', dob: DateTime(2018, 5, 12), numLegs: 4),
    Animal(name: 'Snake', kingdom: 'Reptilia', dob: DateTime(2021, 8, 24), numLegs: 0),
    Animal(name: 'Parrot', kingdom: 'Aves', dob: DateTime(2020, 3, 15), numLegs: 2),
    Animal(name: 'Goldfish', kingdom: 'Actinopterygii', dob: DateTime(2023, 11, 02), numLegs: 0),
    Animal(name: 'Penguin', kingdom: 'Aves', dob: DateTime(2019, 7, 19), numLegs: 2),
  ];

  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk(directions[random.nextInt(directions.length)]);
    print('');
  }

  print('================== PART 2 & 3b: PET HOME ==================\n');

  List<Pet> PET_HOME = [
    Pet.withNickname(nickname: 'Spike', name: 'Bulldog', kingdom: 'Mammalia', dob: DateTime(2022, 1, 1), numLegs: 4),
    Pet.withoutNickname(name: 'Stray Cat', kingdom: 'Mammalia', dob: DateTime(2023, 4, 10), numLegs: 4),
    Pet.withNickname(nickname: 'Fluffball', name: 'Rabbit', kingdom: 'Mammalia', dob: DateTime(2024, 2, 28), numLegs: 4),
  ];

  print('--- Cruel Interactions (Decreasing Kindness below 0) ---');
  PET_HOME[0].kick(60); 
  PET_HOME[0].pet(20);
  print('');

  print('--- Kind Interactions (Increasing Kindness above 1000) ---');
  PET_HOME[2].pet(450);
  PET_HOME[2].feedTreat(60);
  print('');

  print('--- Final Pet Summary ---');
  for (var pet in PET_HOME) {
    print('${pet.nickname} (${pet.name}) -> Current Kindness Level: ${pet.kindness}');
  }
} 

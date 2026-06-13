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
    if (numLegs == 0) {
      print('$name has no legs and cannot walk!');
    } else {
      print('$name is walking towards the $direction.');
    }
  }

  String displayInfo() {
    return '''
Animal Info:
Name    : $name
Kingdom : $kingdom
DOB     : ${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}
Legs    : $numLegs
''';
  }

}

class Pet extends Animal {

  String nickname;
  int kindness;

  Pet({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  })  : kindness = 5,
        super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  Pet.noNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  })  : nickname = 'No nickname',
        kindness = 0,
        super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  void kick(int amount) {
    kindness = kindness - amount;
    print('You kicked $nickname!');
    print('Kindness went down by $amount');
    print('Kindness is now: $kindness');
    print('');
  }

  void pet(int amount) {
    if (kindness < 0) {
      print('Failed! $nickname is too upset to be petted.');
      print('Current kindness: $kindness');
      print('');
    } else {
      kindness = kindness + amount;
      print('You petted $nickname!');
      print('Kindness went up by $amount');
      print('Kindness is now: $kindness');
      print('');
    }
  }

  void play(String playType) {
    if (playType == 'fun') {
      kindness = kindness + 20;
      print('You played a fun game with $nickname!');
      print('Kindness went up by 20');
      print('Kindness is now: $kindness');
      print('');
    } else if (playType == 'rough') {
      kindness = kindness - 10;
      print('You played too rough with $nickname!');
      print('Kindness went down by 10');
      print('Kindness is now: $kindness');
      print('');
    } else {
      print('$nickname did not want to play.');
      print('Kindness is still: $kindness');
      print('');
    }
  }

  @override
  String displayInfo() {
    return '''
Animal Info:
Name     : $name
Kingdom  : $kingdom
DOB      : ${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}
Legs     : $numLegs
Nickname : $nickname
Kindness : $kindness
''';
  }

}


void main() {

  // A. Zoo - has 5 animal objects
  List<Animal> ZOO1 = [
    Animal(
      name: 'Axolotl',
      kingdom: 'Amphibia',
      dob: DateTime(2018, 3, 15),
      numLegs: 4,
    ),
    Animal(
      name: 'Tiger',
      kingdom: 'Mammalia',
      dob: DateTime(2020, 7, 22),
      numLegs: 4,
    ),
    Animal(
      name: 'Python',
      kingdom: 'Reptilia',
      dob: DateTime(2019, 11, 5),
      numLegs: 0,
    ),
    Animal(
      name: 'Anglerfish',
      kingdom: 'Actinopterygii',
      dob: DateTime(2022, 1, 10),
      numLegs: 0,
    ),
    Animal(
      name: 'Salamander',
      kingdom: 'Amphibia',
      dob: DateTime(2015, 6, 30),
      numLegs: 4,
    ),
  ];

  // i. Iterate through ZOO1 and call each animal's functions
  print('ZOO ANIMALS');
  print('');

  for (Animal animal in ZOO1) {
    print(animal.displayInfo());
    animal.walk('North');
    print('');
  }


  // B. Pet Home - has 3 pet objects
  List<Pet> PET_HOME = [
    Pet(
      name: 'Dog',
      kingdom: 'Mammalia',
      dob: DateTime(2021, 4, 12),
      numLegs: 4,
      nickname: 'Buddy',
    ),
    Pet(
      name: 'Rabbit',
      kingdom: 'Mammalia',
      dob: DateTime(2023, 2, 20),
      numLegs: 4,
      nickname: 'Flops',
    ),
    Pet.noNickname(
      name: 'Cat',
      kingdom: 'Mammalia',
      dob: DateTime(2022, 9, 3),
      numLegs: 4,
    ),
  ];

  print('==================================');
  print('');
  print('PET HOME');
  print('');

  for (Pet pet in PET_HOME) {
    print(pet.displayInfo());
  }


  // i. decrease kindness of 2 pets below 0
  print('===============================');
  print('');
  print('Decreasing kindness below 0:');
  print('');

  PET_HOME[0].kick(3);       // Buddy:  5 - 3  = 2
  PET_HOME[0].kick(5);       // Buddy:  2 - 5  = -3 (below 0)

  PET_HOME[2].kick(3);       // Cat:    0 - 3  = -3
  PET_HOME[2].play('rough'); // Cat:   -3 - 10 = -13 (below 0)


  // ii. increase kindness of 2 pets above 1000
  print('===============================');
  print('');
  print('Increasing kindness above 1000:');
  print('');

  PET_HOME[1].pet(1000);     // Flops: 5 + 1000 = 1005 (above 1000)

  PET_HOME[0].play('fun');   // Buddy: -3 + 20 = 17 (recovered)
  PET_HOME[0].pet(1000);     // Buddy: 17 + 1000 = 1017 (above 1000)


  // Final kindness report
  print('Final Kindness Report:');
  print('');

  for (Pet pet in PET_HOME) {
    print('${pet.nickname} : Kindness = ${pet.kindness}');
  }

}
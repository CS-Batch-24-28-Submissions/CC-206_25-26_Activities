import 'animal.dart';
import 'pet.dart';

void main(){
  //concept: type inference
  var ZOO = <Animal>[
    Animal('Lion', 'Mammalia', '2015-06-01', 4),
    Animal('Snake', 'Reptilia', '2018-09-15', 0),
    Animal('Elephant', 'Mammalia', '2010-03-20', 4),
    Animal('Spider', 'Arachnida', '2020-11-05', 8),
    Animal('Fish', 'Pisces', '2019-02-28', 0),
  ];

  print('========== ZOO ==========');
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('east');
    print('-------------------------');
  }

  //concept: list
  var PET_HOME = <Pet>[
    Pet.withNickname('Hamster', 'Mammalia', '2020-01-01', 4, 'Nibbles'),
    Pet.withNickname('Dog', 'Mammalia', '2019-05-10', 4, 'Buddy'),
    Pet.withNickname('Cat', 'Mammalia', '2018-08-20', 4, 'Fluffy'),
  ];

  print('========== PET HOME ==========');
  for (Pet pet in PET_HOME) {
    print(pet.displayInfo());
  }

  //concept: cascading operator
  print('========== DECREASE KINDNESS ==========');
  PET_HOME[0]
    ..kick()
    ..kick()
    ..kick();

  PET_HOME[1]
    ..kick()
    ..kick()
    ..kick()
    ..kick()
    ..kick()
    ..kick()
    ..kick()
    ..kick();
  
  PET_HOME[0].pet();
  PET_HOME[1].pet();

  print('========== INCREASE KINDNESS ==========');
  for (int i =0; i < 45; i++) {
    PET_HOME[1].offerBribe('siomai');
  } 
  print('Buddy\'s kindness is now: ${PET_HOME[1].kindness}');
  for (int i =0; i < 34; i++) {
    PET_HOME[2].pet();
  }
  print('Fluffy\'s kindness is now: ${PET_HOME[2].kindness}');

  print('========== FINAL PET INFO ==========');
  for (Pet pet in PET_HOME) {
    print(pet.displayInfo());
  }
}
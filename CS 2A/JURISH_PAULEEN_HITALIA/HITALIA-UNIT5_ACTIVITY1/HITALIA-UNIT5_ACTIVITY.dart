
class Animal {

  String name;
  String kingdom;
  String dob;
  int numlegs;

  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  void walk(String direction) {
    if (numlegs > 0) {
      print('$name walks towards the $direction.');
    } else {
      print('$name has no legs, so it can’t walk!');
    }
  }

  String displayInfo() {
    return 'Animal: $name | Kingdom: $kingdom | Born: $dob | Legs: $numlegs';
  }
}

class Pet extends Animal {
  String nickname;
  int kindness;

  Pet.withNickname(String name, String kingdom, String dob, int numlegs, this.nickname)
      : kindness = 50, 
        super(name, kingdom, dob, numlegs);

  
  Pet.withoutNickname(String name, String kingdom, String dob, int numlegs)
      : nickname = 'No Nickname',
        kindness = 0, 
        super(name, kingdom, dob, numlegs);

  void kick(int amountToDecrease) {
    kindness = kindness - amountToDecrease;
    print('Oh no! You kicked $nickname. Kindness is now $kindness.');
  }

  void petAction(int amountToIncrease) {
    if (kindness < 0) {
      print('You tried to pet $nickname, but it failed because they are too mad (kindness is below 0).');
    } else {
      kindness = kindness + amountToIncrease;
      print('Yay! You pet $nickname. Kindness is now $kindness.');
    }
  }

  void giveBath(int amountToDecrease) {
    kindness = kindness - amountToDecrease;
    print('$nickname hates baths! Kindness went down to $kindness.');
  }
}

void main() {
  
  List<Animal> ZOO = [
    Animal('Lion', 'Animalia', '2015-01-01', 4),
    Animal('Snake', 'Animalia', '2018-05-12', 0),
    Animal('Eagle', 'Animalia', '2020-03-20', 2),
    Animal('Monkey', 'Animalia', '2019-11-11', 2),
    Animal('Shark', 'Animalia', '2021-07-04', 0),
  ];

  print('--- WELCOME TO THE ZOO ---');
  
 
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('North');
  }

  print('\n--- WELCOME TO THE PET HOME ---');
  
  
  List<Pet> PET_HOME = [
    Pet.withNickname('Dog', 'Animalia', '2022-01-01', 4, 'Buddy'), 
    Pet.withoutNickname('Cat', 'Animalia', '2021-12-12', 4),      
  ];

  
  print('\n[Making a pet angry]');
  PET_HOME[1].giveBath(10); 
  PET_HOME[1].petAction(5);
  
  print('\n[Making a pet super happy]');
  PET_HOME[0].petAction(1000); 
}
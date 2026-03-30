// ============================================================
//  CC-206 | Unit 5 Part 1 Activity
//  Name   : Gwen Tricia G. Cirujales
//  Section: BSCS 2B - AI
//  Date   : March 30, 2026
// ============================================================

// 1: Class Definition (blueprint for creating Animal objects)
class Animal {

  // 2: Instance Variables (properties of each animal)
  String name;        // name of the animal
  String kingdom;     // biological kingdom (e.g., Mammalia, Aves)
  String dob;         // date of birth (format: YYYY-MM-DD)
  int numLegs;        // number of legs the animal has

  // 3: Constructor (used to initialize the object)
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // 4: Named Parameters (direction is optional when calling)
  void walk({String direction = 'forward'}) {
    if (numLegs == 0) {
      print('          $name can\'t walk... no legs...');
    } else {
      print('          $name is walking $direction.');
    }
  }

  // 5: Method (returns formatted information of the object)
  String displayInfo() {
    return 'Name     : $name\n'
           'Kingdom  : $kingdom\n'
           'DOB      : $dob\n'
           'Legs     : $numLegs';
  }
}

// 6: Inheritance (Pet class inherits from Animal)
class Pet extends Animal {

  String nickname;
  int kindness;

  // 7: Named Constructors (different ways to create Pet objects)
  Pet.withNickname(
    String name,
    String kingdom,
    String dob,
    int numLegs,
    this.nickname,
  )   : kindness = 50, //those with nicknames start with some kindness <3
        super(name, kingdom, dob, numLegs);

  Pet.withoutNickname(
    String name,
    String kingdom,
    String dob,
    int numLegs,
  )   : nickname = 'No nickname',
        kindness = 0, //those without nicknames start with 0 kindness (sad :c)
        super(name, kingdom, dob, numLegs);

    // Methods that modify kindness
    void kick(int amount) {
      if (amount < 0) {
        print('          Invalid kick amount! Must be positive.');
        return;
      }
      kindness -= amount;
      print('$name ($nickname) got kicked for $amount damage! Kindness: $kindness');
      print('Note: No animals were harmed in the making of this activity, just a lot of kindness points :c');
      print('');
    }
    
    void pet(int amount) {
      if (kindness < 0) {
      print('Failed to pet $name ($nickname). Kindness is too low!');
      } else {
      kindness += amount;
      print('$name ($nickname) enjoyed the pets! Kindness: $kindness');
      }
    }
    void feed() {
      int gain = kindness > 1000 ? 50 : 100;
      kindness += gain;
      if (gain == 50) {
        print('$name ($nickname) is already very happy! +$gain kindness -> Total: $kindness');
      } else {
        print('$name ($nickname) loved the food! +$gain kindness -> Total: $kindness');
      }
    }

  // 8: Method Overriding (redefines displayInfo from Animal)
  @override
  String displayInfo() {
    return 'Name     : $name\n'
          'Nickname : $nickname\n'
          'Kingdom  : $kingdom\n' 
          'DOB      : $dob\n'
          'Legs     : $numLegs\n'
          'Kindness : $kindness';
  }
}

// ============================================================

void main() {

  // 9: List Collection (stores multiple objects)
  List<Animal> ZOO1 = [
    Animal('Axolotl',        'Amphibia',       '2021-05-12', 4),
    Animal('Platypus',       'Mammalia',       '2026-01-03', 4),
    Animal('Blobfish',       'Actinopterygii', '2017-11-21', 0),
    Animal('Shoebill',       'Aves',           '2020-02-14', 2),
    Animal('Tardigrade',     'Micro-animalia', '2022-01-01', 8),
  ];

  print('==================== ZOO OF WONDERS ====================');

  List<String> directions = ['north', 'south', 'east', 'west', 'around'];

  int count = 0;

  // 10: Looping through the list to display info and actions of each animal
  for (Animal animal in ZOO1) {
    print('\n[${count + 1}] Animal Information');
    print(animal.displayInfo());

    print('Action   :');
    animal.walk(direction: directions[count % directions.length]);

    print('---------------------------------------------');
    count++;
  }

  List<Pet> PET_HOME = [
    Pet.withNickname('Flying Squirrel', 'Mammalia',       '2021-04-01', 4, 'Rizzler'),
    Pet.withNickname('Beaver',          'Mammalia',       '2022-09-12', 4, 'Hawkmoangbeat'),
    Pet.withoutNickname('Pufferfish',   'Actinopterygii', '2023-02-14', 0),
  ];

  print('\n================ PET HOME (INITIAL) ================');

  int countPet = 1;

  for (Pet p in PET_HOME) {
    print('\n[$countPet] Pet Information');
    print(p.displayInfo());
    print('---------------------------------------------');
    countPet++;
  }

  // =============== KINDNESS MODIFICATION ==================
print('\n----------- DECREASING KINDNESS -----------');

int rizzBefore = PET_HOME[0].kindness;
int hawkBefore = PET_HOME[2].kindness;

// Kick pets
PET_HOME[0].kick(200);
PET_HOME[2].kick(30);

print('\n${PET_HOME[0].name} (${PET_HOME[0].nickname})');
print('Kindness: $rizzBefore -> ${PET_HOME[0].kindness}');

print('\n${PET_HOME[2].name} (${PET_HOME[2].nickname})');
print('Kindness: $hawkBefore -> ${PET_HOME[2].kindness}');

print('\nAttempt to pet ${PET_HOME[0].name}:');
if (PET_HOME[0].kindness < 0) {
  print('Result: Failed (kindness below 0)');
}

// =========================================================
print('\n----------- INCREASING KINDNESS -----------');

int artiBefore = PET_HOME[1].kindness;
int rizzRecoverBefore = PET_HOME[0].kindness;

print('\n===== FEEDING BEAVER (Hawkmoangbeat) =====');
for (int i = 0; i < 11; i++) {
  PET_HOME[1].feed();
}

print('\n===== RECOVERING FLYING SQUIRREL (Rizzler) =====');
PET_HOME[0].kick(300);
for (int i = 0; i < 4; i++) {
  PET_HOME[0].feed();
}
PET_HOME[0].pet(80);
PET_HOME[0].feed();
PET_HOME[0].pet(80);


print('\n${PET_HOME[1].name} (${PET_HOME[1].nickname})');
print('Kindness: $artiBefore -> ${PET_HOME[1].kindness}');

print('\n${PET_HOME[0].name} (${PET_HOME[0].nickname})');
print('Kindness: $rizzRecoverBefore -> ${PET_HOME[0].kindness}');

  // ============================================================
  print('\n================ FINAL PET STATUS ================');

  for (Pet p in PET_HOME) {
    print(p.displayInfo());
    print('----------------------------------------');
  }
}
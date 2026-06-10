// [1] Class animal
class Animal {
  // Attributes
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

// Constructor
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

// Method: Walk
  void walk(String direction) {
    if (numLegs == 0) {
      print('$name can\'t walk.');
    } else {
      print('$name is walking $direction.');
    }
  }

// Method: displayInfo
  String displayInfo() {
    return '''
Animal Information:
  Name    : $name
  Kingdom : $kingdom
  DOB     : ${dob.toLocal().toString().split(' ')[0]}
  Legs    : $numLegs
    ''';
  }
}


// [2] Pet class extends Animal

class Pet extends Animal {
  String? nickname;
  int kindness;

  // Constructor WITH nickname → kindness starts at a positive value
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required String nickname,
  })  : nickname = nickname,
        kindness = 10,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  // Constructor WITHOUT nickname → kindness starts at 0
  Pet.withoutNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  })  : nickname = null,
        kindness = 0,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  // Kick action which decreases kindness 
  void kick(int amount) {
    kindness -= amount;
    print('You kicked ${nickname ?? name}! Kindness decreased by $amount → Kindness: $kindness');
  }

  // Pet action which increases kindness (fails if kindness < 0) 
  void pet(int amount) {
    if (kindness < 0) {
      print(
          '${nickname ?? name} is upset and refuses to be petted! Kindness: $kindness');
    } else {
      kindness += amount;
      print(
          'You gently pet ${nickname ?? name}. Kindness increased by $amount → Kindness: $kindness');
    }
  }

  // Additional Method: Feed action which increases kindness 
  void feed(String food) {
    int gain = 5;
    kindness += gain;
    print(
        'You fed ${nickname ?? name} some $food! Kindness increased by $gain → Kindness: $kindness');
  }

  // Additional Method: Ignore action decreases kindness 
  void ignore() {
    int loss = 3;
    kindness -= loss;
    print(
        'You ignored ${nickname ?? name}... Kindness decreased by $loss → Kindness: $kindness');
  }

  // Override displayInfo to include Pet-specific info
  @override
  String displayInfo() {
    return '''
Animal Information:
  Name    : $name
  Kingdom : $kingdom
  DOB     : ${dob.toLocal().toString().split(' ')[0]}
  Legs    : $numLegs
  Nickname: ${nickname ?? 'None'}
  Kindness: $kindness
  ''';
  }
}

void main() {
  print('====================================');
  print(' Pet with Nickname (Kindness = 10)');
  print('====================================');

  Pet dog = Pet.withNickname(
    name: 'Hudson',
    kingdom: 'Mammalia',
    dob: DateTime(2020, 3, 15),
    numLegs: 0,
    nickname: 'Langga',
  );

  print(dog.displayInfo());
  dog.walk('north');
  dog.pet(5);
  dog.feed('bone');
  dog.ignore();
  dog.kick(20);       // drops kindness below 0
  dog.pet(5);         // should fail since kindness < 0

  print('');
  print('====================================');
  print(' Pet without Nickname (Kindness = 0)');
  print('====================================');

  Pet cat = Pet.withoutNickname(
    name: 'Snuggles',
    kingdom: 'Reptile',
    dob: DateTime(2021, 11, 5),
    numLegs: 0,
  );

  print(cat.displayInfo());
  cat.walk('south');
  cat.feed('tuna');
  cat.ignore();
  cat.ignore();
  cat.pet(3);
  cat.kick(8);
}
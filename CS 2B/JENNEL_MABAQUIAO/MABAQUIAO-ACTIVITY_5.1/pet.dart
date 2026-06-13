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


// Pet extends Animal
// Pet inherits all attributes and methods of Animal
class Pet extends Animal {

  // A. Attributes
  // i. Nickname
  String nickname;  // nickname of the pet
  // ii. Kindness
  int kindness;     // measures relationship with pet


  // C. Constructors
  // Constructor with nickname
  // kindness starts at 5 when nickname is given
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

  // Constructor without nickname
  // kindness starts at 0
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


  // B. Methods
  // i. Kick method - decreases kindness by given amount
  void kick(int amount) {
    kindness = kindness - amount;
    print('You kicked $nickname!');
    print('Kindness went down by $amount');
    print('Kindness is now: $kindness');
    print('');
  }

  // ii. Pet method - increases kindness if it's greater than 0, otherwise it fails
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

  // iii. Play method - my own method, changes kindness based on play type
  // playing a fun game increases kindness
  // playing rough decreases kindness
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

  // override displayInfo to include nickname and kindness
  @override
  String displayInfo() 
  {
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


void main () 
{
  // test constructor with nickname - kindness starts at 5
  Pet dog = Pet(
    name: 'Dog',
    kingdom: 'Mammalia',
    dob: DateTime(2021, 4, 12),
    numLegs: 4,
    nickname: 'Buddy',
  );

  print(dog.displayInfo());
  dog.walk('South');
  print('');
  dog.pet(5);         // kindness: 5 + 5 = 10
  dog.kick(3);        // kindness: 10 - 3 = 7
  dog.play('fun');    // kindness: 7 + 20 = 27
  dog.play('rough');  // kindness: 27 - 10 = 17


  // test constructor without nickname - kindness starts at 0
  Pet cat = Pet.noNickname(
    name: 'Cat',
    kingdom: 'Mammalia',
    dob: DateTime(2022, 9, 3),
    numLegs: 4,
  );

  print(cat.displayInfo());
  cat.kick(5);        // kindness: 0 - 5 = -5
  cat.pet(10);        // Failed! kindness is negative
  cat.play('fun');    // kindness: -5 + 20 = 15 (recovered)

}
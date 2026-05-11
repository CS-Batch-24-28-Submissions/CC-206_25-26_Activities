//Gem Adrian Candagana BSCS 2B AI
import 'Animal.dart';

// 1. CONCEPT: Inheritance (Single Inheritance)
class Pet extends Animal {
  //2. CONCEPT: Nullable Types
  String? nickName;
  int kindness;

  //constructor with nickname
  //3. CONCEPT: Named Constructors
  Pet.withNickname(
    String name,
    String kingdom,
    DateTime dob,
    int numLegs,
    this.nickName,
  ) : kindness = 10,
      //4. CONCEPT: Constructor Shorthand
      super(name, kingdom, dob, numLegs);

  //constructor with no nickname
  Pet.withNoNickname(String name, String kingdom, DateTime dob, int numLegs)
    : kindness = 0,
      super(name, kingdom, dob, numLegs);

  //kick method
  //5. CONCEPT: Methods
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print(
      'You kicked ${nickName ?? name}. That is very unkind of you. Kindness is decreased by $decreaseValue',
    );
    print('Current Kindess Value: $kindness\n');
  }

  //pet method
  void pet(int increaseValue) {
    //6. CONCEPT: Conditionals
    if (kindness <= 0) {
      print(
        'Failed! Cannot pet ${nickName ?? name}. Kindness score: $kindness\n',
      );
    } else {
      kindness += increaseValue;
      print(
        '${nickName ?? name} successfully petted. Kindness is increased by $increaseValue',
      );
      print('Current Kindness: $kindness\n');
    }
  }

  //added personal methods
  void feed(int increaseValue) {
    kindness += increaseValue;
    print(
      'You have fed ${nickName ?? name}. Kindness is increased by $increaseValue',
    );
    print('Current Kindness: $kindness\n');
  }

  void ignored(int decreaseValue) {
    kindness -= decreaseValue;
    print(
      'You have ignored ${nickName ?? name}, he/she is angry. kindness is decreased by $decreaseValue',
    );
    print('Current Kindness: $kindness\n');
  }
}

//7. CONCEPT: Entry Point
void main() {
  //test with nickname
  //8. CONCEPT: Avoiding the 'new' keyword
  Pet cat = Pet.withNickname(
    'Cat',
    'Mammalia',
    DateTime(2026, 3, 30),
    4,
    'Oreo',
  );
  print(cat.displayInfo());

  //test for methods
  cat.kick(3);
  cat.pet(5);
  cat.feed(7);
  cat.ignored(3);

  //test for negative kindness
  print(
    '========================================================================',
  );
  cat.ignored(20);
  cat.pet(3);

  print('\n');

  //test with no nickname
  Pet bird = Pet.withNoNickname('Bird', 'Aves', DateTime(2026, 3, 30), 2);
  print(bird.displayInfo());

  //test for methods
  bird.feed(7);
  bird.kick(3);
  bird.pet(5);
  bird.ignored(3);

  //test for negative kindness
  print(
    '========================================================================',
  );
  bird.ignored(20);
  bird.pet(3);
}

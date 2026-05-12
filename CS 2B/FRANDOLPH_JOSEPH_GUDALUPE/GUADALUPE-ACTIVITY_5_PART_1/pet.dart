import 'animal.dart';

class Pet extends Animal {
  String? nickname;
  int kindness = 0; // Initial relationship value is set to 0

  Pet.withNickname(String name, String kingdom, String dob, int numlegs, this.nickname)
      : kindness = 10, 
        super(name, kingdom, dob, numlegs);

  Pet.withoutNickname(String name, String kingdom, String dob, int numlegs)
      : super(name, kingdom, dob, numlegs);


  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print('$name was kicked. Kindness decreased by $decreaseValue. (Current Kindness: $kindness)');
  }


  void petAnimal(int increaseValue) {
    if (kindness < 0) {
      print('Sorry, $name is too unhappy to be petted. Be kind please.');
    } else {
      kindness += increaseValue;
      print('You petted $name! Kindness increased by $increaseValue. (Current Kindness: $kindness)');
    }
  }

  // Additional Method to influence 
  void giveTreat(int treatValue) {
    kindness += treatValue;
    print('You gave $name a treat! (Current Kindness: $kindness)');
  }
}
import 'animal.dart';

class Pet extends Animal {
  //concept: inheritance
  String _nickname;
  int _kindness;

  //concept: getters (fat/big arrow)
  String get nickname => _nickname;
  int get kindness => _kindness;

  //concept: constructor with nickname
  Pet.withNickname(String name, String kingdom, String dob, int numlegs, this._nickname) 
  : _kindness = 100, //default kindness value for pets 
  super(name, kingdom, dob, numlegs);

  //concept: constructor without nickname
  Pet(String name, String kingdom, String dob, int numlegs)
  : _nickname = 'No nickname', 
    _kindness = 0, 
    super(name, kingdom, dob, numlegs);

  //Kick method (decrease kindness value)
  void kick() {
    _kindness -= 15;
    print('$_nickname was kicked! Kindness level is now $_kindness.');
  }

  //Pet method (increase kindness value)
  void pet() {
    if (_kindness < 0) {
      print('$_nickname is too hurt to be petted! Kindness level is low.');
    } else {
      _kindness += 30;
      print('$_nickname is being petted! Kindness increased to $_kindness.');
    }
  }

  //concept: switch statement
  void offerBribe(String item) {
  switch (item.toLowerCase()) {
    case 'kibble':
      _kindness += 2;
      print('$_nickname: "Aint no way"');
      break;
    case 'siomai':
      _kindness += 25;
      print('$_nickname: "Thanks."');
      break;
    case 'kangkong':
      _kindness -= 10;
      print('$_nickname: "Ew."');
      break;
    default:
      print('$_nickname sniffed the $item and walked away.');
  }
}

//Override displayInfo method to include nickname and kindness
  @override
  String displayInfo() {
    return '''
    --- Pet Information ---
    Name: $name
    Nickname: $_nickname
    Kingdom: $kingdom
    Date of Birth: $dob
    Number of Legs: $numlegs
    Kindness Level: $_kindness
    ''';
  }
}
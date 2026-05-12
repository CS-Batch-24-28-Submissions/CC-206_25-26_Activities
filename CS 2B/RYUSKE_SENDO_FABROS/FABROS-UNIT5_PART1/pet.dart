import 'Animal.dart';

class Pet extends Animal {
  String _nickname;
  int _kindness = 0;

  // Constructor requiring nickname (sets kindness to positive value)
  Pet(String name, String kingdom, String dob, int numLegs, this._nickname)
    : _kindness = 30,
      super(name, kingdom, dob, numLegs);

  // 9. concept: Named Constructors
  Pet.noNickname(String name, String kingdom, String dob, int numLegs)
    : _nickname = "Unnamed",
      super(name, kingdom, dob, numLegs);

  // kick pet method
  void kick(int val) {
    _kindness -= val;
    print('$_nickname was kicked! kindness decreased by $val.');
  }

  // petting pet method
  void pet(int val) {
    if (_kindness < 0) {
      print('FAILED: $_nickname is currently unfriendly.');
    } else {
      _kindness += val;
      print('$_nickname was petted! kindness increased by $val.');
    }
  }

  //feed pet method
  void feed(int val) {
    _kindness += val;
    print('$_nickname was fed! kindness increased by $val.');
  }

  @override
  String displayInfo() {
    return super.displayInfo() + '''
    Nickname: $_nickname
    Kindness: $_kindness
    ''';
  }
}

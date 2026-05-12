// 7. concept: Private Class Members
class Animal {
  String _name;
  String _kingdom;
  String _dob;
  int _numLegs;

  // 6. concept: Constructor Shorthand
  Animal(this._name, this._kingdom, this._dob, this._numLegs);

  // Walk Method
  void walk(String direction) {
    // 4. concept: Conditionals
    if (_numLegs > 0) {
      print('$_name walks to the $direction');
    } else {
      print('$_name can\'t walk');
    }
  }

  String displayInfo() {
    // 8. concept: Multiline Strings
    return '''
$_name's information

    Name: $_name
    Kingdom: $_kingdom
    Date of Birth: $_dob
    Number of Legs: $_numLegs
    ''';
  }
}

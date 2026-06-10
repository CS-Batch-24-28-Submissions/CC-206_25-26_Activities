class Animal {
  //concept: encapsulation
  String _name; 
  String _kingdom;
  String _dob; //date of birth
  int _numlegs;

  //concept: getters (fat/big arrow)
  String get name => _name;
  String get kingdom => _kingdom;
  String get dob => _dob;
  int get numlegs => _numlegs;

  //concept: constructor
  Animal(this._name, this._kingdom, this._dob, this._numlegs); 

  //concept: conditional statement
  void walk(String direction) {
    if (_numlegs == 0){
      print('$_name cannot walk.');
    } else {
      print('$_name walks toward $direction.');
    }
  }

  //display info method (multiline strings)
  String displayInfo() {
    return '''
    --- Animal Information ---
    Name: $_name
    Kingdom: $_kingdom
    Date of Birth: $_dob
    Number of Legs: $_numlegs
    ''';
  }
}
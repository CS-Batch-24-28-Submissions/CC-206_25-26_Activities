class Animal {

  // A. Attributes
  String name;      // name of animal
  String kingdom;   // section of animal kingdom
  DateTime dob;     // date of birth
  int numLegs;      // number of legs

  // Constructor
  Animal(
    {
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // B. Methods
  // i. Walk method - prints walking direction, but fails if numLegs is 0
  void walk(String direction) 
  {
    if (numLegs == 0) {
      print('$name has no legs and cannot walk!');
    } else {
      print('$name is walking towards the $direction.');
    }
  }

  // ii. Display info
  String displayInfo() 
  {
    return '''
Animal Info:
Name    : $name
Kingdom : $kingdom
DOB     : ${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}
Legs    : $numLegs
''';
  }
}

// Main function 
void main() 
{
  Animal lion = Animal(
    name: 'Lion',
    kingdom: 'Mammalia',
    dob: DateTime(2018, 3, 15),
    numLegs: 4,
  );

  Animal snake = Animal(
    name: 'Python',
    kingdom: 'Reptilia',
    dob: DateTime(2019, 11, 5),
    numLegs: 0,
  );

  print(lion.displayInfo());
  lion.walk('North');

  print('');

  print(snake.displayInfo());
  snake.walk('East');
}
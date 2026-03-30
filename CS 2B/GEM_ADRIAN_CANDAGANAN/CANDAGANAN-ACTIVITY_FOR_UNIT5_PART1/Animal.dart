//Gem Adrian C. Candaganan BSCS 2B AI

//Animal Class Declaration
//1. CONCEPT: Classes & Constructors
class Animal {
  //attributes required
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  //my constructor for this class
  //2. CONCEPT: Constructor Shorthand
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  //walk method
  //3. CONCEPT: Conditionals
  walk(String direction) {
    if (numLegs > 0) {
      print('$name walked towards $direction');
    } else {
      print(
        '$name cannot walk towards the $direction because he/she has no legs',
      );
    }
  }

  //diplayInfo method
  String displayInfo() {
    return '''
---------------Animal Information-----------------
      Name: $name
      Kingdom: $kingdom
      Date-of-Birth: ${dob.year}-${dob.month}-${dob.day}
      Number of Legs: $numLegs
----------------------------------------------------\n''';
  }
}

//4. CONCEPT: Entry Point
main() {
  //test-case 1
  //5. CONCEPT: Avoiding 'new' keyword
  Animal dog = Animal('Dog', 'Mammalia', DateTime(2026, 3, 26), 4);

  dog.walk('right');
  print(dog.displayInfo());

  //test-case 2
  //6. CONCEPT: Cascading Operator
  Animal seaLion = Animal('Sea Lion', 'Mammalia', DateTime(2022, 3, 27), 0)
    ..walk('left');
  print(seaLion.displayInfo());
}

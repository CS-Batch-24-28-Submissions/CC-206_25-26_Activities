// Class for all animals

// CONCEPT 1: Class
class Animal {
  // CONCEPT 2: Data types
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // CONCEPT 3: Constructor shorthand using 'this'
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // CONCEPT 4: Named constructor (for animals with no known birthday)
  Animal.withoutDob({
    required String name,
    required String kingdom,
    required int numLegs,
  }) : name = name,
       kingdom = kingdom,
       dob = DateTime(0),
       numLegs = numLegs;

  // CONCEPT 5: Conditional - checks if the animal has legs before walking
  void walk(String direction) {
    if (numLegs <= 0) {
      print('$name has no legs and cannot walk!');
    } else {
      print('$name walks towards the $direction.');
    }
  }

  // CONCEPT 6: Fat arrow - returns animal info using a single expression
  String displayInfo() =>
      """
-------- Animal Info --------
Name            : $name
Kingdom         : $kingdom
Date-of-Birth   : ${dob.year == 0 ? "Unknown" : _formatDate(dob)}
Number of Legs  : $numLegs
""";

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}

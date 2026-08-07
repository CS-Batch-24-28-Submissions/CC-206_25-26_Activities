class Animal {
  String name; //animal name
  String kingdom; //section of the animal kingdom it belongs
  DateTime dob; //date of birth
  int numLegs; //number of legs

  Animal(
    this.name,
    this.kingdom,
    this.dob,
    this.numLegs,
  ); //constructor------use of this. keyword to initialize the properties

  void walk(String direction) {
    //method to make the animal walk in a certain direction
    if (numLegs <= 0) {
      print("\n$name can't walk because it has no legs.");
    } else {
      print("\n$name is walking $direction.");
    }
  }

  String displayInfo() {
    //method to display the animal's information
    return ''' 
\nAnimal Information: 
Name: $name
Kingdom: $kingdom
Date of Birth: ${dob.toLocal().toString().split(' ')[0]}
Number of Legs: $numLegs 
  ''';
  }
}

void main() {
  Animal bird = Animal("Blue", "Bird", DateTime(2006, 6, 30), 2);
  Animal worm = Animal("Billy", "Animalia", DateTime(2009, 12, 20), 0);

  bird.walk("north");
  print(bird.displayInfo());

  worm.walk("south");
  print(worm.displayInfo());
}

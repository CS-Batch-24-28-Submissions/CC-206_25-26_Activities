// 1. Creating Dart Class
class Animal {
  // CONCEPT: Private Class Members using underscore prefix
  String _name;
  String _kingdom;
  DateTime _dob;
  int _numLegs;

  // Constructor
  // CONCEPT: Constructor Shorthand directly initializing fields
  Animal(this._name, this._kingdom, this._dob, this._numLegs);

// method: walk
void walk(String direction){
    if (_numLegs <= 0){
        print("$_name can't walk because it has no legs.");
    } else {
        print("$_name is walking towards the $direction");
    }
}
String displayInfo(){
    // CONCEPT: Multiline Strings using triple quotes
    return '''
    
    ======== ANIMAL SUMMARY =======
    Name: $_name
    Kingdom: $_kingdom
    Date of Birth: ${_dob.toLocal().toString().split(' ')[0]}
    Number of Legs: $_numLegs
    ===============================
    ''';
}}

// 2. Creating Pet Class
// CONCEPT: Single Inheritance using the 'extends' keyword
class Pet extends Animal {
    String? _nickname; // CONCEPT: Null Safety - '?' allows null values
    int _kindness = 0;

    // constructor 1 on which it requires nickname and sets kindness to positive number
    // CONCEPT: Super Keyword passing data to the parent class constructor
    Pet(String name, String kingdom, DateTime dob, int numLegs, this._nickname)
        : super(name, kingdom, dob, numLegs) {
      _kindness = 10; 
    }

    // constructor 2 on which it excludes the nickname
    // CONCEPT: Named Constructor used because Dart doesn't support overloading
    Pet.noNickname(String name, String kingdom, DateTime dob, int numLegs)
        : super(name, kingdom, dob, numLegs);

// method: kick (decrease kindness)
void kick(int value) {
  _kindness -= value;
    print("Ouch! You kicked $_name. Kindness decreased by $value. Current Kindness: $_kindness");
}

// method: pet action
void petGesture(int value) {
    if (_kindness < 0) {
    print("Failed: $_name is too grumpy to be petted right now (Kindness is below 0).");
    } else {
      _kindness += value;
      print("You petted $_name! Kindness increased by $value. Current Kindness: $_kindness");
    }
  }

// extra method: give treetos
void giveTreat(int value) {
    _kindness += value;
    print("Yum! $_name ate a treat. Kindness is now $_kindness.");
  }
}

// CONCEPT: Entry Point on which every Dart app starts with main()
void main(){
    // creating dog instance
    // CONCEPT: instantiating without the 'new' keyword
    Animal dog = Animal("Ponyo", "Mammal", DateTime(2020, 9, 17), 4);
    print(dog.displayInfo());
    dog.walk("South");
    print("\n");

    //creating a fish instance
    Animal fish = Animal("Pipay","Animalia",DateTime(2024, 8, 12),0);
    print(fish.displayInfo());
    fish.walk("East");

    print("\n======== PET TEST =======\n");
    Pet myCat = Pet("Luna", "Mammal", DateTime(2022, 5, 12), 4, "Lunatic");
    // CONCEPT: String Interpolation using $ and ${}
    print("Pet Name: ${myCat._name} (aka ${myCat._nickname})");
    myCat.petGesture(5); 
    myCat.kick(20);      
    myCat.petGesture(5); 

    print("\n--- Stray Pet Test ---");

    // create pet no nickname (kindness: 0)
    Pet stray = Pet.noNickname("Unknown", "Reptile", DateTime(2023, 1, 1), 0);
    stray.giveTreat(5);
    stray.walk("North");

    //3. Dart Program with Zoo List and PetHome List
    // CONCEPT: Collections or Lists in which storing objects in a growable array
    List<Animal> ZOO = [
      Animal("Leo", "Mammal", DateTime(2015, 10, 20), 4),
      Animal("Zara", "Mammal", DateTime(2018, 5, 15), 4),
      Animal("Slither", "Reptile", DateTime(2020, 2, 10), 0),
      Animal("Bubbles", "Fish", DateTime(2022, 11, 5), 0),
      Animal("Hedwig", "Bird", DateTime(2021, 12, 25), 2),
    ];

    print("\n======== PROBLEM 3: ZOO ITERATION =======\n");
    // CONCEPT: For-In Loop iterating through a collection
    for (var animal in ZOO) {
      print(animal.displayInfo());
      animal.walk("West");
    }

    // a list called PET_HOME containing 2-3 different Pet objects
    List<Pet> PET_HOME = [
      Pet("Bucky", "Mammal", DateTime(2019, 8, 12), 4, "Winter"),
      Pet("Goldie", "Fish", DateTime(2023, 4, 3), 0, "Bloop"),
      Pet.noNickname("Rocky", "Mammal", DateTime(2021, 1, 1), 4),
    ];

    print("\n======== PROBLEM 3: PET_HOME MANAGEMENT =======\n");

    // decrease the kindness value of 1-2 pets below 0 (negative values)
    PET_HOME[0].kick(50); 

    // increase the kindness value of 1-2 pets above 1000
    PET_HOME[1].giveTreat(1500); 

    // final kindness report
    print("\n--- FINAL KINDNESS REPORT ---");
      for (var pet in PET_HOME) {
        print("Pet: ${pet._name.padRight(10)} | Kindness: ${pet._kindness}");
      }
}
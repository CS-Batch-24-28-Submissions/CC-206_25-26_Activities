


class Animal {
  final String name;
  final String kingdom;
  final DateTime dob;
  final int numLegs;

 Animal(this.name, this.kingdom, this.dob, this.numLegs);

 void walk(String direction){
    if (numLegs < 2){
      print("$name does not have enough legs to walk!");
      return;
    }
    print("$name is walking $direction");

 }

 String displayInfo(){
  return '''

  Name: $name
  Kingdom: $kingdom
  Date of birth: ${dob.toLocal()}
  Number of Legs: $numLegs
  ''';
 }
}

class Pet extends Animal {

  String? nickname;
  int kindness = 0;

  //Constructor 1: With Nickname (Kindness automatically set to 500 if this constructor was called)
  Pet(String name, String kingdom, DateTime dob, int numLegs, this.nickname, {this.kindness = 200}) 
  : super(name, kingdom, dob, numLegs);

  //Constructor 2: No Nickname 
  Pet.noNick(String name, String kingdom, DateTime dob, int numLegs, this.kindness) 
  : super(name, kingdom, dob, numLegs);

  //Kick function. Decreases kindness by 500
  void kick(){
    kindness -= 500;
    print("> You kicked the $name ! It disliked that. Minus 500 kindness points!" );
    displayKindness();
  }

  //Kick function. Increases kindness by 250 when kindness is above 0. Fails otherwise.
  void pet(){
    if (kindness >= 0) {
      kindness += 250;
      print("> You pet the $name ! It liked that. Plus 250 kindness points!");
    } else {
      print("> Woops! looks like the $name's too mad at you to let you pet it!");
    }
    displayKindness();
  }

  //Feed function. Increases kindness by 1000
  void feed(){
    kindness += 1000;
    print("> You gave the $name some food! It really liked that. Plus 1000 kindness points!");
    displayKindness();
  }
  
  //Displays Kindness.
  void displayKindness() => print(">      -> Current Kindness points = $kindness" );
  
}




void main(){

  // LIST INSTANTIATION
  List<Animal> ZOO = [
    Animal("Giraffe", "Mammal", DateTime(2015, 7, 5), 4 ),
    Animal("Monkey", "Mammal", DateTime(2011, 3, 10), 2 ),
    Animal("Parrot", "Bird", DateTime(2012, 2, 14), 2 ),
    Animal("Shark", "Fish", DateTime(2013, 8, 21), 0 ),
    Animal("Hawk", "Bird", DateTime(2014, 6, 12), 2 )
  ];

  List<Pet> PET_HOME = [
    Pet("Dog", "Mammal", DateTime(2011, 3, 10), 4, "Xen"),
    Pet("Cat", "Mammal", DateTime(2011, 3, 10), 4, "Polter"),
    Pet.noNick("Parrot", "Bird", DateTime(2023, 3, 11), 2, 250)
  ];


  // OUTPUT CODE

  print("----------ZOO ANIMAL INFO---------");
  for (var animal in ZOO){
    print(animal.displayInfo());
    animal.walk("forward");
  }
  print("-------------PET INFO-------------");
  PET_HOME[0].kick();
  PET_HOME[0].pet();
  PET_HOME[1].pet();
  PET_HOME[2].feed();
  print("----------------------------------");
  
}

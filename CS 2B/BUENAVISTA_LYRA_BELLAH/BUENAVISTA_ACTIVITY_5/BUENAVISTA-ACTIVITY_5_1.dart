// Buenavista, Lyra Bellah A. | CS - 2B
// Activity 5.1 

/* Programming concepts: class, inheritance, constructors, methods,
   string interpolation, multi-line strings, conditionals, lists, loops. 
*/

// -- #1 class Animal
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // constructor shorthand
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // methods
  void walk(String direction){
    if (numLegs == 0 ){
      print("$name can't walk :<");
    } else{
      print("$name is heading $direction");
    }
  }

  String displayInfo(){
    String summary = 
    // multi-line string
    """ 
    >-----------------<
        Animal Info
    >-----------------<
    Name: $name
    Kingdom: $kingdom
    Date of Birth: $dob
    Legs: $numLegs
    >-----------------<\n
    """;
    return summary;
  }
}

// -- #2 Extend class Animal
class Pet extends Animal {
  String nickname;
  int kindness;

  // named constructor. kindness starts at 0
  Pet.noNickname(String name, String kingdom, String dob, int numLegs)
  :nickname = "none",
  kindness = 0, 
  super(name, kingdom, dob, numLegs);

  // default contructor. kindness starts at 5
  Pet(String name, String kingdom, String dob, int numLegs, this.nickname) 
  :kindness = 5, 
  super (name, kingdom, dob, numLegs);


  // methods
  void kick(){
    print("\n > Current Kindness Value: $kindness");
    kindness -= 95;
    print("You kicked $name! Kindness decreased by 95. \n > Updated Kindness: $kindness");
  }

  void pet(){
    if (kindness < 0){ // increase kindness IFF kindness is > 0
      print("Cannot pet $name. Insufficient kindness.");
    } else{
      print("\n > Current Kindness Value: $kindness");
      kindness += 600;
      print("Petting $name... Kindness increased by 600 :) \n > Updated Kindness Value: $kindness");
    }
  }

  // another method to increase kindness value
  void feed(){
    print("\n > Current Kindness Value: $kindness");
    kindness += 500;
    print ("You fed $name~ Kindness increased by 500. \n > Updated Kindness Value: $kindness ");
  }
}

// -- #3 list of 5 different Animal objects [ZOO]
void main(){
   List<Animal> ZOO = [
    Animal("Tyun", "Animalia", "02/05/02", 4),
    Animal("Gyu", "Animalia", "03/13/01", 0),
    Animal("Steve", "Animalia", "12/05/00", 2),
    Animal("Yawnz", "Animalia", "09/13/99", 4),
    Animal("Hyuka", "Animalia", "08/14/02", 0),
  ];

  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("south");
    print("");
  }
  
  // PET_HOME list
  List<Pet> PET_HOME = [
    Pet("Oliver", "Animalia", "02/24/25", 4, "Ollie"),
    Pet.noNickname("Gyu", "Animalia", "03/13/03", 0),
  ];
  
  Pet pet1 = PET_HOME[0]; 
  Pet pet3 = PET_HOME[1]; 

  // increase kindness of pet (Ollie) above 1000
  print("\n ==== ${pet1.name} (${pet1.nickname}) ====");
  pet1.pet();  
  pet1.feed(); 

  // decrease kindness of pet (Gyu) below 0 
  print("\n ==== ${pet3.name} (no nickname) ==== ");
  pet3.kick();
  pet3.pet();
}


//Base Class
class Animal {
  String name; 
  String kingdom;
  String dob;
  int NumLegs;

  //Constructor
  Animal(this.name, this.kingdom, this.dob, this.NumLegs);
  //Void Methods
  void walk(String direction) {
    if (NumLegs == 0) {
       print("$name has no legs, therefore it cannot walk.");
    } else {
     
       print("$name is walking towards $direction");
    }
  }
   
   String displayInfo() {
    return """

    ==== Animal Information ====
    Name: $name
    Kingdom: $kingdom 
    Date of Birth: $dob
    Number of Legs: $NumLegs
    =============================

    """; }


    

}
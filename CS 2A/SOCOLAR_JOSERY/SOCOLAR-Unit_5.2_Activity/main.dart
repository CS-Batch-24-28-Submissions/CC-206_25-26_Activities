//Main Function
void main() {
  var a = Animal('Giraffe', 'Mammals', '4/20/2005', 4);
  a.walk('Left');

  a = Animal('Snake', 'Reptiles', '3/19/2006', 0);
  a.walk('Right');
}

//Class Animal
class Animal {
  //Attributes
  String name = "";
  String kingdom = "";
  String dob = "";
  int numLegs = 0;

  //Constructor
  Animal(String name, String kingdom, String dob, int numLegs) {
    this.name = name;
    this.kingdom = kingdom;
    this.dob = dob;
    this.numLegs = numLegs;
  }

  //Methods
  void walk(String direction) {
    print('---WALK FUNCTION---');
    if(this.numLegs == 4) {
      print('The animal called ${this.name} is walking to the ${direction}');
    } else {
      print("It can't walk");
    }
  }
}
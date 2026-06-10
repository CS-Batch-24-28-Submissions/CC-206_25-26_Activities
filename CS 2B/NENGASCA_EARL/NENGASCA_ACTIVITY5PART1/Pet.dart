import 'Animal.dart';

//Inheritance
class Pet extends Animal {
  String nickname;
  int kindness = 0;



  void kick() {
    kindness -= 2;


    if (nickname == "No nickname") {
   
      print("$name has been kicked. Kindness level has decreased to $kindness.");
    } else {

    print("$nickname has been kicked. Kindness level has decreased to $kindness.");}
  }

  void pet() {
    kindness += 2;
    if (kindness > 0) {
     print("You have pet $nickname. The kindness level has increased by 2. Current kindness level is $kindness.");
    }
    else {
      print("$nickname has no kindness level. Petting has failed");
    }
  }

  void feed() {
    kindness += 1000;

    print("You have fed $nickname. It's kindness level has increased by 1000, current kindness level is $kindness.");
  }
  //Constructors
  Pet.WithNickname(
    String name,
    String kingdom,
    String dob,
    int NumLegs,
    this.nickname,
  ) : kindness = 2, super(name, kingdom, dob, NumLegs);

  Pet.withoutNickname(
    String name,
    String kingdom,
    String dob,
    int NumLegs,
  ) : nickname = "No nickname", super(name, kingdom, dob, NumLegs);






  
}
import 'Animal.dart';

class Pet extends Animal{
  String? nickname;
  int kindnessValue=0;

  // CONCEPT: Constructor Shorthand
  Pet({
    required this.nickname,
    required String name,
    required String kingdom,
    required String dob,
    required int numlegs,
  }) : super(name: name, kingdom: kingdom, dob: dob, numlegs: numlegs);

  // CONCEPT: Named Constructors
  Pet.withNickname({
    required String nickname,
    required String name,
    required String kingdom,
    required String dob,
    required int numlegs,
  }) : nickname = nickname,
       kindnessValue = 1, super(name: name, kingdom: kingdom, dob: dob, numlegs: numlegs);

  void kick() {
    kindnessValue -=1;
  }

  void pet() {
    // CONCEPT: Traditional if/else statement
    if (kindnessValue < 0) {
      print("Failed to pet, Kindness value is less than 0");
      return;
    } else {
      kindnessValue +=2;
    }
  }

  void shot() {
    kindnessValue -=9999;
  }

  @override
  String displayInfo() {
    String petInfo =
        "Nickname: $nickname, Kindness Value: $kindnessValue";
    return petInfo;
  }
}

void main() {
  // CONCEPT: No more "new" keyword
  Pet dog = Pet(
    nickname: "Doggo",
    name: "Dog",
    kingdom: "Animalia",
    dob: "January 1, 2023",
    numlegs: 4,
  );
  print(dog.displayInfo());
  dog.pet();
  print(dog.displayInfo());
  dog.kick();
  print(dog.displayInfo());
  dog.shot();
  print(dog.displayInfo());

  // CONCEPT: Named Constructors
  Pet dogTwo = Pet.withNickname(
    nickname: "Doggo2",
    name: "Dog2",
    kingdom: "Animalia",
    dob: "February 14, 2024",
    numlegs: 4,
  );
  print(dogTwo.displayInfo());
  }
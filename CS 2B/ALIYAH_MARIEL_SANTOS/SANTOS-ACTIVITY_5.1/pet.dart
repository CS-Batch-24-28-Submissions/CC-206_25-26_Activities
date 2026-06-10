import "animal.dart";

// ========== [ SANTOS - Activity 5.1 ] ==========
class Pet extends Animal {
  //a. Attributes
  String? nickname = "Milo"; //nullable string
  int kindness = 0;

  // Constructors
  // a. Constructor with Nickname

  //  CONCEPT #6: Named Function Parameters
  Pet.withNickname({
    required String name,
    required String kingdom,
    required String dob,
    required int numLegs,
    required this.nickname,
  }) : kindness = 5, // positive kindness
       super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  // b. Constructor without nickname
  Pet.noNickname({
    required String name,
    required String kingdom,
    required String dob,
    required int numLegs,
  }) : nickname = null,
       kindness = 5, // positive kindness
       super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  //b. Methods

  // 1. Kick - decrease kindness
  void kick(int value) {
    kindness -= value;
    print(
      "Oh no, $nickname got kicked! $nickname's kindness decreased by $value. Current kindness: $kindness",
    );
  }

  // 2. petAnimal - petting the animal increases kindness if kindness >= 0
  void petAnimal(int value) {
    if (kindness < 0) {
      print(
        "Failed: Kindness level too low! $nickname doesn't enjoy being pet right now. Try feeding it first. Current kindness: $kindness",
      );
    } else {
      kindness += value;
      print(
        "$nickname is happy after being petted by you! Kindness increased by $value. Current kindness: $kindness",
      );
    }
  }

  // Other methods:
  // 3. feed = increases kindness value by 20 points
  void feed() {
    int value = 20; //fixed value of 20
    kindness += value;
    print(
      '$nickname has been fed and is happy! Kindness increased by $value. Current kindness: $kindness',
    );
  }

  // 4. value = decreases kindness value by 20 points
  void yell() {
    int value = 20; //fixed value of 20
    kindness -= value;
    print(
      "You yelled at $nickname! $nickname is sad and hurt after you yelled at him/her. Kindness decreased by $value. Current kindness: $kindness",
    );
  }

  //displayInfo - reuse displayInfo method from parent class Animal by overriding
  @override
  String displayInfo() {
    return super.displayInfo() +
        """
      Nickname: $nickname
      Kindness: $kindness
      """;
  }
}

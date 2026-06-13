class Pet {
  String nickname = "Pet";
  int kindness = 0;

  Pet(this.nickname) { this.kindness = 500; }
  // CONCEPT USED (CU): Named Constructor
  Pet.noNickName(); 

  // CONCEPT USED (CU): Named Function Parameter
  void kick({int times = 1}) { 
    int kindnessBoost = 100;
    int totalBoosted = kindnessBoost * times;
    kindness -= totalBoosted;

    print('You have kicked $nickname $times times. Kindness decreased by $totalBoosted'); 
  }

  void pet() {
    if (kindness < 0) {
      print('Failed to pet $nickname. Kindness is at $kindness');
    } else {
      int kindnessBoost = 250;
      kindness += kindnessBoost;
      print('Petting $nickname. Kindness increased by $kindnessBoost');
    }
  }

  void feed(Food food, {int times = 1}) {
    int totalBoosted = food.kindnessBoost * times; 
    kindness += totalBoosted;
    
    print('$nickname was fed with ${food.name} $times times. Kindness increased by $totalBoosted');
  }

  void checkKindness() {
    print("$nickname's kindness level is at $kindness");
  }
}

class PetBuilder {
  
  List<Pet> buildThreePets() => [
    Pet('Nasch'),
    Pet.noNickName(),
    Pet('Galaxy')
  ];
}

enum Food {
  vegetable("vegetable", 300),
  meat("meat", 500);

  final String name;
  final int kindnessBoost;

  const Food(this.name, this.kindnessBoost);
}
// 1. Concept: Object-Oriented Programming (Classes)
class Animal {
  // 2. Concept: Data Types and Variables
  String name;
  String Kingdom;
  DateTime Dob;
  int Numlegs;

  Animal(this.name, this.Kingdom, this.Dob, this.Numlegs);

  // 3. Concept: Positional Parameters
  void Walk(String direction) {
    // 4. Concept: Conditional Logic
    if (Numlegs == 0) {
      print('$name can’t walk');
    } else {
      print('$name walks $direction');
    }
  }

  // 5. Concept: String Interpolation
  String displayInfo() {
    return 'Summary: $name | Kingdom: $Kingdom | Born: ${Dob.year}-${Dob.month}-${Dob.day} | Legs: $Numlegs';
  }
}

// 6. Concept: Inheritance
class Pet extends Animal {
  String? Nickname;
  int Kindness;

  // 7. Concept: Named Constructors
  Pet.withNickname(String name, String Kingdom, DateTime Dob, int Numlegs, this.Nickname)
      : Kindness = 20, // Initial positive value as per 2.c.ii
        super(name, Kingdom, Dob, Numlegs);

  Pet.withoutNickname(String name, String Kingdom, DateTime Dob, int Numlegs)
      : Kindness = 0,
        super(name, Kingdom, Dob, Numlegs);

  void Kick(int value) {
    Kindness -= value;
    print('Action: Kicked $Nickname. Kindness decreased by $value.');
  }

  void PetGesture(int value) {
    if (Kindness < 0) {
      print('Action failed: $Nickname is unhappy.');
    } else {
      Kindness += value;
      print('Action: Petted $Nickname. Kindness increased by $value.');
    }
  }

  // 8. Concept: Custom Function Implementation
  void GiveTreat(int value) {
    Kindness += value;
    print('Action: Gave $Nickname a treat! Kindness increased by $value.');
  }
}

void main() {
  // 9. Concept: Collections (Lists)
  List<Animal> ZOO = [
    Animal('Penguin', 'Aves', DateTime(2006, 5, 22), 2),
    Animal('Tarsier', 'Mammalia', DateTime(2006, 2, 12), 2),
    Animal('Dolphin', 'Mammalia', DateTime(2006, 7, 02), 0),
    Animal('Guinea Pig', 'Mammalia', DateTime(2006, 8, 12), 4),
    Animal('Pigeon', 'Aves', DateTime(2006, 10, 22), 2),
  ];

  print('--- ZOO LOG ---');
  // 10. Concept: Loops (Iteration)
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.Walk('south');
  }

  List<Pet> PET_HOME = [
    Pet.withNickname('Duck', 'Aves', DateTime(2006, 12, 12), 2, 'Gray'),
    Pet.withNickname('Guinea Pig', 'Mammalia', DateTime(2006, 1, 02), 4, 'Winter'),
    Pet.withNickname('Tarsier', 'Mammalia', DateTime(2006, 3, 22), 2, 'Zoro'),
  ];

  print('\n--- PET INTERACTIONS ---');
  
  // Requirement 3.b.i: Kindness below 0
  PET_HOME[0].Kick(50); 
  PET_HOME[0].PetGesture(10); // Demonstrates the failure logic

  // Requirement 3.b.ii: Kindness above 1000
  PET_HOME[1].GiveTreat(1200);
  PET_HOME[2].GiveTreat(1500);

  print('\n--- FINAL PET STATUS ---');
  for (var p in PET_HOME) {
    print('${p.name} (Nickname: ${p.Nickname}) -> Kindness: ${p.Kindness}');
  }
}

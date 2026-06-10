# CONCEPTS

These are the concepts employed during code implementation:

---

_animal.dart_

### 1. CONCEPT #1: Constructing Classes

```dart
// CONCEPT #1: Constructing Classes
class Animal {
  //a. Attributes:
  String name = "Dog";
  String kingdom = "Animalia";

  // CONCEPT #2 Variable Initialization
  String dob;
  int numLegs;

  // Constructor
  Animal({
    // CONCEPT #3: Constructor Shorthand
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });
}
```

### 2. CONCEPT #2: Variable Initialization

```dart
// CONCEPT #2 Variable Initialization
String dob;
int numLegs;
```

### 3. CONCEPT #3: Constructor Shorthand

```dart
  // Constructor
  Animal({
    // CONCEPT #3: Constructor Shorthand
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

```

### 4. CONCEPT #4: Big Fat Arrow

```dart
  //  CONCEPT #4: Big Fat Arrow
String displayInfo() =>
      //  CONCEPT #5: Multiline Strings
      """
    Name: $name
    Kingdom: $kingdom
    DOB: $dob
    Number of legs: $numLegs
    """;
```

### 5. CONCEPT #5: Multiline Strings

```dart
String displayInfo() =>
      //  CONCEPT #5: Multiline Strings
      """
    Name: $name
    Kingdom: $kingdom
    DOB: $dob
    Number of legs: $numLegs
    """;
```

---

_pet.dart_

### 6. CONCEPT #6: Named Function Parameters

```dart
  //  CONCEPT #6: Named Function Parameters
  Pet.withNickname({
    required String name,
    required String kingdom,
    required String dob,
    required int numLegs,
    required this.nickname,
  }) : kindness = 5, // positive kindness
       super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);
```

---

_main.dart_

### 7. CONCEPT #7: Lists and Arrays

```dart
// CONCEPT #7: Lists and Arrays
  List<Animal> ZOO = [
    Animal(name: 'Penguin', kingdom: 'Animalia', dob: '2016-04-12', numLegs: 2),
    Animal(name: 'Shark', kingdom: 'Animalia', dob: '2014-08-30', numLegs: 0),
    Animal(name: 'Otter', kingdom: 'Animalia', dob: '2019-01-25', numLegs: 4),
    Animal(name: 'Tiger', kingdom: 'Animalia', dob: '2017-11-05', numLegs: 4),
    Animal(
      name: 'Polar Bear',
      kingdom: 'Animalia',
      dob: '2013-02-18',
      numLegs: 4,
    ),
  ];
```

### 8. CONCEPT #8: Looping

```dart
  //  CONCEPT #8: Looping
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('forward');
    print('---------------------------------------------');
  }

```

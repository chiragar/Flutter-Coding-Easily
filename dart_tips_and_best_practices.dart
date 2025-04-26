// 📄 dart_tips_and_best_practices.dart
//
// Collection of Dart and Flutter Best Practices, Fix Commands, and Basic Concepts

import 'package:flutter/material.dart';

void main() {
  // Entry point to test if needed
}

/*
------------------------------------------------------------
🛠️ Dart Fix Commands
------------------------------------------------------------

Check for issues (like missing `const`, unused imports, etc.):

dart fix --dry-run

Apply all safe fixes automatically:

dart fix --apply

✅ Useful for cleaning up your project according to Dart's latest best practices.

------------------------------------------------------------
📱 Adaptive Widgets (Platform-Specific UI)
------------------------------------------------------------

- Flutter provides `.adaptive` constructors for certain widgets.
- They automatically adjust to Android (Material) or iOS (Cupertino) styles.

Examples:

Icon(Icons.adaptive.share),
Slider.adaptive(value: 0, onChanged: (val) {}),
CircularProgressIndicator.adaptive()

✅ Great for cross-platform apps with native feel.

------------------------------------------------------------
🔍 Difference Between var and dynamic
------------------------------------------------------------

1️⃣ Using var:

void exampleVar() {
  var a = 0;
  a = 2;
  // a = "abc"; ❌ Error: 'a' is still int type
  print(a); // Output: 2
}

2️⃣ Using dynamic:

void exampleDynamic() {
  dynamic a = 0;
  a = 2;
  a = "abc"; // ✅ Allowed
  print(a); // Output: abc
}

✅ Key Point:
- `var`: Type is determined at compile time, fixed after assignment.
- `dynamic`: Type can change at runtime.

------------------------------------------------------------
🆚 Difference Between final and const
------------------------------------------------------------

void exampleFinalConst() {
  final a; // Final can be assigned once later
  a = 2;
  print("Final $a"); // Output: Final 2

  const b = 3; // Const must be assigned at compile-time
  print("Const $b"); // Output: Const 3
}

✅ Key Point:
- `final`: Set once at runtime.
- `const`: Set once at compile-time.

------------------------------------------------------------
🔁 Type Promotion Example
------------------------------------------------------------

void exampleTypePromotion() {
  Person person = Person(name: "ABC", address: Address(city: "City"));

  var p = person.address;
  if (p != null) {
    // Type promotion happens here automatically
    print(p.city);
    print(p.street);
    print(p.state);
  }
}

class Person {
  final String? name;
  final Address? address;
  Person({this.name, this.address});
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  Address({this.street, this.city, this.state});
}

✅ Key Point:
- Dart automatically promotes non-null variables inside if-checks.
- Makes accessing properties safer without explicit null-checks.

------------------------------------------------------------
*/


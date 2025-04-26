// 📄 getx_state_management_guide.dart
//
// Complete Guide: GetX State Management + Flutter Dependency Setup + State Concepts

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Entry point to test if needed
}

/*
------------------------------------------------------------
⚙️ Flutter: Add Dependencies
------------------------------------------------------------

Add these main dependencies:

flutter pub add http flutter_bloc bloc get_it google_fonts

Add these developer dependencies:

flutter pub add dev:build_runner json_serializable

✅ These packages are very useful for HTTP requests, state management, dependency injection, fonts, and code generation.

------------------------------------------------------------
📚 State Management: Why Do We Need It?
------------------------------------------------------------

Flutter = Everything is a Widget.
Two basic types:
- StatelessWidget
- StatefulWidget

State management is required to handle and update data dynamically in a scalable and clean way across the app.

------------------------------------------------------------
🚀 3 Pillars of GetX
------------------------------------------------------------

1. State Management
2. Route Management
3. Dependency Management

------------------------------------------------------------
🛠️ GetX Utilities
------------------------------------------------------------

1. Internationalization (Multi-language Support)
2. Themes (Light/Dark Mode)
3. Popups, Bottom Sheets, Dialogs (without using context)

------------------------------------------------------------
🧩 GetX: State Management
------------------------------------------------------------

▸ 1 - Simple State Management (GetBuilder)

- Simple and easy.
- Works similar to `setState()`.
- Uses `GetBuilder()` widget.

Example:

// Controller Class
class Controller extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update(); // Updates UI
  }
}

// UI Code
GetBuilder<Controller>(
  init: Controller(),
  builder: (_) => Text('${_.counter}'),
)

✅ Key Points:
- `update()` manually triggers UI rebuild.
- Initialize controller only once.

------------------------------------------------------------
🔁 2 - Reactive State Management (Obx and GetX)

Traditional Flutter:
- Streams for every variable.
- StreamBuilder widget.
- Create extra classes for states.

In GetX:
- No StreamControllers.
- No extra StreamBuilders.
- No extra State classes.

Reactive Example:

var name = 'Jonatas Borges'.obs;

// Update UI when 'name' changes
Obx(() => Text("${controller.name}"));

✅ Simpler, faster, and lightweight.

------------------------------------------------------------
🧠 More Reactive Example (with multiple observables)

Controller File:

import 'package:get/get.dart';

final count1 = 0.obs;
final count2 = 0.obs;

int get sum => count1.value + count2.value;

// Usage in UI:

GetX<Controller>(
  builder: (controller) {
    print("count 1 rebuild");
    return Text('${controller.count1.value}');
  },
),

GetX<Controller>(
  builder: (controller) {
    print("count 2 rebuild");
    return Text('${controller.count2.value}');
  },
),

GetX<Controller>(
  builder: (controller) {
    print("count 3 rebuild");
    return Text('${controller.sum}');
  },
)

✅ Key Points:
- Only rebuilds specific parts of the widget tree.
- Highly efficient compared to setState().
- No context required for updates.

------------------------------------------------------------
*/


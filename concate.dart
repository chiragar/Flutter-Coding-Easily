class Student {
  String name;
  int rollno;

  Student(this.name, this.rollno);
}

void main() {
  List<Student> student1 = [Student("ABC", 1), Student("ABC123", 4)];
  List<Student> student2 = [Student("ABC12", 3), Student("ABC333", 6)];

  List<Student> mystudent = [...student1, ...student2,Student("ABC222", 2)];

  for (var stud in mystudent) {
    print("Roll No : ${stud.rollno} | Name : ${stud.name}");
  }
}

//OutPut:
// Roll No : 1 | Name : ABC
// Roll No : 4 | Name : ABC123
// Roll No : 3 | Name : ABC12
// Roll No : 6 | Name : ABC333
// Roll No : 2 | Name : ABC222

// --------------------------------------------
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [1, 2, 3, 4, 5];

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ...numbers.map((number)=>ListTile(
                title: Text('Number $number')))
          ],
        ),
      ),
    );
  }
}

//OutPut:
//Number 1
//Number 2
//Number 3
//Number 4
//Number 5



//  //
//  Import LIBRARIES
import 'package:dart_dataclass_generator/models/person.dart';
import 'package:flutter/material.dart';
//  Import FILES
//  PARTS
//  PROVIDERS

//

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  Person generatePerson(
      {required int id, required String name, required String email}) {
    // return const Person(id: 1, name: 'John', email: 'john@gmail.com');
    return Person(id: id, name: name, email: email);
  }

  @override
  Widget build(BuildContext context) {
    // final person1 = Person(id: 1, name: 'John', email: 'john@gmail.com');
    // const person1 = Person(id: 1, name: 'John', email: 'john@gmail.com');
    final person1 =
        generatePerson(id: 1, name: 'John', email: 'john@gmail.com');
    final person2 = person1.copyWith(id: 2, email: 'johndoe@gmail.com');
    // final person3 = Person(id: 1, name: 'John', email: 'john@gmail.com');
    // const person3 = Person(id: 1, name: 'John', email: 'john@gmail.com');
    final person3 =
        generatePerson(id: 1, name: 'John', email: 'john@gmail.com');
    debugPrint(person1.toString());
    debugPrint(person2.toString());
    debugPrint((person1 == person3).toString());
    debugPrint(person1.hashCode.toString());
    debugPrint(person3.hashCode.toString());

//     // Person constructor NOT 'const' + final person1, final person2, final person3 -> equlity is false! and 2 hashcodes are different
//     // Person constructor is 'const' + const person1, final person2, const person3 -> equlity is true! and 2 hashcodes are the same
//     ///  At times is necessary to create an object with a variable valued instead of a constant value
//     // Use the function generatePerson() to create PersonX  Person constructor is 'const' + final person1, final person2, final person3 -> equlity is false! and hashcodes are different
//     // Add equality operator at Person class + Person constructor is 'const' + final person1, final person2, final person3 -> equlity is false! and hashcodes are different

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Page'),
      ),
      body: const Center(child: Text('Text is in the Debug Console')),
    );
  } // End of build
}    // End of PersonPage

//  //
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../widgets/custom_button.dart';
import 'person_page.dart';
//  PARTS
//  PROVIDERS

//

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: const <Widget>[
            CustomButton(
              title: 'Person',
              child: PersonPage(),
            ),
          ],
        ),
      ),
    );
  }
}

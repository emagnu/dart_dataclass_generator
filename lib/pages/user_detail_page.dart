//  //
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../models/user.dart';
//  PARTS
//  PROVIDERS

//

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.username),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('name: ${user.name}'),
                Text('email: ${user.email}'),
                Text('phone: ${user.phone}'),
                Text('website: ${user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.brown[50],
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: ShowAddress(address: user.address),
          ),
          Container(
            color: Colors.amber[50],
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: ShowCompany(company: user.company),
          ),
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;

  const ShowAddress({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('street: ${address.street}'),
        Text('suite: ${address.suite}'),
        Text('city: ${address.city}'),
        Text('street: ${address.street}'),
        Text('zipcode: ${address.zipcode}'),
        Row(
          children: <Widget>[
            Text('latitude: ${address.geo.lat}'),
            const SizedBox(width: 10.0),
            Text('longitude: ${address.geo.lng}'),
          ],
        ),
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;

  const ShowCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Company',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('name: ${company.name}'),
        Text('catch phrase: ${company.catchPhrase}'),
        Text('bs: ${company.bs}'),
      ],
    );
  }
}

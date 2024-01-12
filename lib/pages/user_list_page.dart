//  //
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../models/user.dart';
import '../repositories/fetch_user.dart';
import 'user_detail_page.dart';
//  PARTS
//  PROVIDERS

//

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    try {
      setState(() => loading = true);
      users = await fetchUsers();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error.isEmpty
              ? ListUsers(users: users)
              : buildError(),
    );
  } // End of build(BuildContext context)

//
  Widget buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              error,
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: _fetchUsers,
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
} // End of _UserListPageState()

//

//
class ListUsers extends StatelessWidget {
  final List<User> users;

  const ListUsers({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetailPage(user: user),
            ),
          ),
          leading: CircleAvatar(
            child: Text(user.id.toString()),
          ),
          title: Text(user.name),
          // subtitle: Text(users.email),
        );
      },
    );
  } // End of (BuildContext context)
}     // End of ListUsers{}
  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_round_app1/controllers/users_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    Provider.of<UsersController>(context, listen: false).fetchAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsersController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: provider.users.length,
                itemBuilder: (context, index) {
                  final data = provider.users[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${data.id}"),
                        ),
                        title: Text(
                          "${data.name}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${data.email}",
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

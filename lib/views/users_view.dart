import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_round_app1/controllers/users_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    Provider.of<UsersController>(context, listen: false).fetchAllUsers();
  }

  void _sortByEmail() {
    Provider.of<UsersController>(context, listen: false).sortUsersByEmail();
  }

  void _sortByName() {
    Provider.of<UsersController>(context, listen: false).sortUsersByName();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsersController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: _sortByName,
            tooltip: 'Sort by Name',
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: _sortByEmail,
            tooltip: 'Sort by Email',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                provider.searchUsers(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: provider.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.filteredUsers.length,
                    itemBuilder: (context, index) {
                      final data = provider.filteredUsers[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("${data.id}"),
                            ),
                            title: Text(
                              "${data.name}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${data.email}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

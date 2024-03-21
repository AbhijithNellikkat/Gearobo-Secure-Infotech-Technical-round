import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_round_app1/controllers/controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<UserDetailsController>(context, listen: false).fetchDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserDetailsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: provider.datas.length,
                itemBuilder: (context, index) {
                  final data = provider.datas[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text("${data['id']}"),
                        ),
                        title: Text(
                          "${data['name']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${data['email']}",
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

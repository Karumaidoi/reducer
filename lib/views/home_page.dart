// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reducer/API/network.dart';
import 'package:reducer/model/userModel.dart';
import 'package:reducer/views/details_page.dart';
import 'package:reducer/widgets/card_widget.dart';

import '../Provider/dark_theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<UsersModel>> getUsers;

  @override
  void initState() {
    // Get Data during widget initailization
    getUsers = Network.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: FutureBuilder<List<UsersModel>>(
            future: getUsers,
            builder: (context, snapshot) {
              // Check if the snapshot has no data
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // Render a widget if the snapshot has data
              var data = snapshot.data!;
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailsPage(id: data[index].id);
                        }));
                      },
                      child: CardWidget(
                        name: data[index].name,
                        email: data[index].email,
                        about: data[index].bio,
                        occupation: data[index].occupation,
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

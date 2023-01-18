import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reducer/API/network.dart';
import 'package:reducer/widgets/card_widget.dart';

import '../model/userModelg.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<UserModel> getUser;
  String email = '';
  String name = '';
  String bio = '';
  String occupation = '';

  @override
  void initState() {
    // Populate user with API data
    getUser = Network.getUser(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Details Page",
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 15,
          ),
        ),
      ),
      body: FutureBuilder<UserModel>(
          future: getUser,
          builder: (context, snapshot) {
            // Check if the snapshot has no data
            // Show a Circular Progress bar
            if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            }

            // Render a widget
            return CardWidget(
                name: snapshot.data!.name,
                email: snapshot.data!.email,
                occupation: snapshot.data!.occupation,
                about: snapshot.data!.bio);
          }),
      // FAB for patching or updating user
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateUser(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

// Methood for showing a pop up to update User
  Future<dynamic> updateUser(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoTextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    placeholder: 'Name',
                  ),
                  CupertinoTextField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    placeholder: 'Email',
                  ),
                  CupertinoTextField(
                    onChanged: (value) {
                      occupation = value;
                    },
                    placeholder: 'Occupation',
                  ),
                  CupertinoTextField(
                    onChanged: (value) {
                      bio = value;
                    },
                    placeholder: 'Bio',
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    // Check if the user fields are empty
                    if (email == '' ||
                        name == '' ||
                        occupation == '' ||
                        bio == '') return;

                    // Call the API responsible to patch User
                    Network.patchUser(widget.id, name, email, occupation, bio);

                    // Pop Out the alert dialog
                    Navigator.of(context).pop();

                    // Set local state of the new User
                    setState(() {
                      getUser = Network.getUser(widget.id);
                    });
                  },
                  child: const Text("UPDATE"))
            ],
          );
        });
  }
}

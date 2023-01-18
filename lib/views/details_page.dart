import 'package:flutter/material.dart';
import 'package:reducer/API/network.dart';
import 'package:reducer/model/userModel.dart';
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

  @override
  void initState() {
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
            if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            }

            return CardWidget(
                name: snapshot.data!.name,
                email: snapshot.data!.email,
                occupation: snapshot.data!.occupation,
                about: snapshot.data!.bio);
          }),
    );
  }
}

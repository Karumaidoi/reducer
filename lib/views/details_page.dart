import 'package:flutter/material.dart';
import 'package:reducer/model/userModel.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Details Page",
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ExpansionTile(
          title: Text("Acknowledgement"),
          children: [
            ListTile(
              title: Text('Developer'),
              subtitle: Text("Alex Maina, Software Developer"),
            )
          ],
        ),
      ),
    );
  }
}

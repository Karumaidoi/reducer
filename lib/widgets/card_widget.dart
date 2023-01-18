import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String email;
  final String occupation;
  final String about;
  const CardWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.occupation,
      required this.about});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(name.split(' ')[0].split('')[0]),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        about,
                        textWidthBasis: TextWidthBasis.parent,
                        style: TextStyle(
                            color: Theme.of(context).buttonColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScoresWidget extends StatelessWidget {
   ScoresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SCORE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "0",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BEST",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "10",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ],
    );
  }
}

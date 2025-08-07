import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.17,
        child: Image.network(
            'https://wallpapers.com/images/hd/flappy-bird-character-illustration-tfhwubtt9cxlsebo.png'));
  }
}

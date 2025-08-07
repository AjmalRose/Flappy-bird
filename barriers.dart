import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double size;

  const Barrier({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 10.0,
          color: Colors.green.shade700,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData iconData;
  const MyIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Icon(iconData, size: 40),
    );
  }
}

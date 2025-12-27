import 'package:flutter/material.dart';

Container circleAvatar(
  String user, {
  required List<Color> gradientColors,
  double size = 48,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: Text(
        user[0].toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.38, // auto scale
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

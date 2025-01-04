import 'package:flutter/material.dart';

class Slideshow {
  final String name;
  final IconData icon;
  final List<Widget> slides;

  Slideshow({
    required this.name,
    required this.icon,
    required this.slides,
  });
}

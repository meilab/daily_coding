import 'package:flutter/material.dart';

class CardItem {
  const CardItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.imgUrl,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String imgUrl;
  final void Function() onTap;

  @override
  String toString() {
    return '$runtimeType($title)';
  }
}

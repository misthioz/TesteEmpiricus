import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  final String title;
  final String description;

  const Feature({required this.title, required this.description, super.key});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        Text(description, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}

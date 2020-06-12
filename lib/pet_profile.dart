import 'package:flutter/material.dart';
import 'package:dawggi/models/Dog.dart';

class PetsDetails extends StatelessWidget {
  final Dog dog;

  PetsDetails(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.title)),
    );
  }
}
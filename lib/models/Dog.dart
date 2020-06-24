import 'package:flutter/foundation.dart';
import 'dart:io';

class Dog {
  final String id;
  final String title;
  final int amount;
  final DateTime arrivalDate;
  final DateTime departureDate;
  final String observations;
  final File dogsPhoto;

  Dog({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.arrivalDate,
    @required this.departureDate,
    @required this.observations,
    @required this.dogsPhoto
  });
}

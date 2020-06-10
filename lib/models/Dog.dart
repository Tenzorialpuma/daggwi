import 'package:flutter/foundation.dart';

class Dog {
  final String id;
  final String title;
  final int amount;
  final DateTime arrivalDate;
  final DateTime departureDate;
  final String observations;

  Dog({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.arrivalDate,
    @required this.departureDate,
    @required this.observations,
  });
}

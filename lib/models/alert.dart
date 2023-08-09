import 'package:flutter/cupertino.dart';

class Alert with ChangeNotifier {
  final String id;
  final String type;
  final String description;
  final DateTime date;

  Alert({
    this.id,
    this.type,
    this.description,
    this.date,
  });
}

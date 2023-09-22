import 'package:flutter/cupertino.dart';

class Travel with ChangeNotifier {
  final String id;
  final String userId;
  final String destinyName;
  final String startPoint;
  final String endPoint;
  final double rating;
  final DateTime startTime;
  final DateTime endTime;
  final String travelMethod;

  Travel(
      {this.id,
      this.userId,
      this.destinyName,
      this.startPoint,
      this.endPoint,
      this.rating,
      this.startTime,
      this.endTime,
      this.travelMethod});
}

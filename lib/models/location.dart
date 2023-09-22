import 'package:flutter/cupertino.dart';

class Location with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String image_url;
  final String coordinates;
  final String state;

  Location(this.name, this.description, this.image_url, this.coordinates,
      this.state, this.id);
}

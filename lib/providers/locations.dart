import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:maasapp/models/location.dart';
import 'package:maasapp/models/travel.dart';

import '../models/user.dart';

class Locations with ChangeNotifier {
  List<Location> _locations = [];

  User loggedUser;

  final String authToken;
  final String userId;

  Locations(this.authToken, this.userId, this._locations);

  List<Location> get locations {
    return [..._locations];
  }

  Future<List<Location>> fetchAllLocations() async {
    var url = Uri.parse(
      'https://maasapp-ce83f-default-rtdb.firebaseio.com/locations.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }

      final List<Location> loadedLocations = [];
      try {
        extractedData.forEach(
          (locationId, locationData) {
            loadedLocations.add(Location(
                locationData["name"],
                locationData["description"],
                locationData["image_url"],
                locationData["coordinates"],
                locationData["state"],
                locationId));
          },
        );
      } catch (error) {
        print(error);
      }

      print("valfo2234");

      _locations = loadedLocations;
      notifyListeners();
      return _locations;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

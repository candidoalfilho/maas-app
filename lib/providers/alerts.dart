import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:maasapp/models/alert.dart';
import 'package:maasapp/models/travel.dart';

import '../models/user.dart';

class Alerts with ChangeNotifier {
  List<Alert> _alerts = [];

  User loggedUser;

  final String authToken;
  final String userId;

  Alerts(this.authToken, this.userId, this._alerts);

  List<Alert> get alerts {
    return [..._alerts];
  }

  Future<List<Alert>> fetchAllAlerts() async {
    var url = Uri.parse(
      'https://maasapp-ce83f-default-rtdb.firebaseio.com/alerts.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }

      final List<Alert> loadedAlerts = [];
      extractedData.forEach(
        (alertId, alertData) {
          loadedAlerts.add(
            Alert(
                id: alertId,
                date: DateTime.parse(alertData["date"]),
                description: alertData["description"],
                type: alertData["type"]),
          );
        },
      );

      _alerts = loadedAlerts;
      notifyListeners();
      return _alerts;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addAlert(String description, String type) async {
    final url = Uri.parse(
        'https://maasapp-ce83f-default-rtdb.firebaseio.com/alerts.json?auth=$authToken');

    try {
      try {
        final response = await http.post(
          url,
          body: json.encode(
            {
              'date': DateTime.now().toString(),
              'description': description,
              'type': type,
            },
          ),
        );
      } catch (error) {
        print(error);
      } finally {
        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

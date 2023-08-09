import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Users with ChangeNotifier {
  List<User> _users = [];

  User loggedUser;

  final String authToken;
  final String userId;

  Users(this.authToken, this.userId, this._users);

  List<User> get users {
    return [..._users];
  }

  Future<User> fetchLoggedUserData() async {
    var url = Uri.parse(
      'https://maasapp-ce83f-default-rtdb.firebaseio.com/users/${userId}.json?auth=$authToken',
    );

    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return null;
      }

      loggedUser = User(
        userId,
        extractedData['name'],
        extractedData['email'],
        extractedData['imageUrl'],
      );
      print(extractedData);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

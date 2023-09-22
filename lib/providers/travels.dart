import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:maasapp/models/travel.dart';

import '../models/user.dart';

class Travels with ChangeNotifier {
  List<Travel> _travels = [];

  User loggedUser;

  final String authToken;
  final String userId;

  Travels(this.authToken, this.userId, this._travels);

  List<Travel> get travels {
    return [..._travels];
  }

  Future<List<Travel>> fetchAllTravels() async {
    var url = Uri.parse(
      'https://maasapp-ce83f-default-rtdb.firebaseio.com/travels.json?auth=$authToken',
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }

      final List<Travel> loadedTravels = [];
      extractedData.forEach(
        (travelId, travelData) {
          loadedTravels.add(
            Travel(
                id: travelId,
                userId: travelData["userId"],
                destinyName: travelData["destinyName"],
                startPoint: travelData["startPoint"],
                endPoint: travelData["endPoint"],
                rating: double.parse(travelData["rating"]),
                startTime: DateTime.parse(travelData["startTime"]),
                endTime: DateTime.parse(travelData["endTime"]),
                travelMethod: travelData["travelMethod"]),
          );
        },
      );

      _travels = loadedTravels;
      notifyListeners();
      return _travels;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addTravel(Travel travel) async {
    var url = Uri.parse(
      'https://maasapp-ce83f-default-rtdb.firebaseio.com/travels.json?auth=$authToken',
    );

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'userId': userId,
            'destinyName': travel.destinyName,
            'startPoint': travel.startPoint,
            'endPoint': travel.endPoint,
            'rating': travel.rating.toString(),
            'startTime': travel.startTime.toString(),
            'endTime': travel.endTime.toString(),
            'travelMethod': travel.travelMethod
          },
        ),
      );
      notifyListeners();
    } catch (error) {}
  }

  //   Future<void> addCompetition(Travel travel, String leagueId) async {
  //   final url = Uri.parse(
  //       'https://fit-league-c67d9-default-rtdb.firebaseio.com/competitions.json?auth=$authToken');

  //   try {
  //     try {
  //       final response = await http.post(
  //         url,
  //         body: json.encode(
  //           {
  //             'administration': userId,
  //             'bet_type': competition.bet_type,
  //             'description': competition.description,
  //             'difficulty': 'hard',
  //             'end_date': competition.end_date.toString(),
  //             'image_url': competition.image_url,
  //             'inviteCode': competition.inviteCode,
  //             'is_open': true,
  //             'name': competition.name,
  //             'start_date': competition.start_date.toString(),
  //             'user_limit': competition.user_limit,
  //             'visibility': competition.is_public,
  //           },
  //         ),
  //       );

  //       var competition_id = json.decode(response.body)['name'];

  //       var user_post_url = Uri.parse(
  //           'https://fit-league-c67d9-default-rtdb.firebaseio.com/competitions/${competition_id}/users.json?auth=$authToken');

  //       await http.post(
  //         user_post_url,
  //         body: json.encode('${userId}'),
  //       );

  //       var league_post_url = Uri.parse(
  //           'https://fit-league-c67d9-default-rtdb.firebaseio.com/leagues/${leagueId}/competitions.json?auth=$authToken');

  //       await http.post(
  //         league_post_url,
  //         body: json.encode('${competition_id}'),
  //       );
  //     } catch (error) {
  //       print(error);
  //     } finally {
  //       notifyListeners();
  //     }
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }

}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/models/location.dart';
import 'package:maasapp/providers/alerts.dart';
import 'package:maasapp/providers/auth.dart';
import 'package:maasapp/providers/locations.dart';
import 'package:maasapp/providers/travels.dart';
import 'package:maasapp/screens/config_screen.dart';
import 'package:maasapp/screens/create_alert_screen.dart';
import 'package:maasapp/screens/profile_screen.dart';
import 'package:maasapp/screens/travel_screen.dart';
import 'package:maasapp/widgets/local_card.dart';
import 'package:maasapp/widgets/recent_destinations.dart';
import 'package:maasapp/widgets/recent_reports.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen();

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<Travels>(context, listen: false).fetchAllTravels();
    await Provider.of<Alerts>(context, listen: false).fetchAllAlerts();
    await Provider.of<Locations>(context, listen: false).fetchAllLocations();
  }

  var _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Viajar',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.spatial_audio_off_outlined), label: 'Alertas'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
          ],
          onTap: (value) {
            var routeMap = {
              0: MainScreen(),
              1: TravelScreen(),
              2: CreateAlertScreen(),
              3: ProfileScreen()
            };

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => routeMap[value],
                transitionDuration: Duration(milliseconds: 200),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
        ),
        body: FutureBuilder(
          future: _refreshData(context),
          builder: ((context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshData(context),
                  child: Consumer3<Travels, Alerts, Locations>(
                    builder:
                        (context, travelData, alertData, locationData, _) =>
                            Container(
                      color: Color(0xe5e5e5).withOpacity(1),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Paraíba',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.amber.shade800,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Trocar',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  ConfigurationScreen(),
                                              transitionDuration:
                                                  Duration(milliseconds: 200),
                                              transitionsBuilder:
                                                  (_, a, __, c) =>
                                                      FadeTransition(
                                                          opacity: a, child: c),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.grey.shade700,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Recomendações',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: locationData.locations
                                          .map((e) => LocalCard(
                                                name: e.name,
                                                id: e.id,
                                                image_url: e.image_url,
                                              ))
                                          .toList())),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Destinos recentes',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0x023047)
                                                      .withOpacity(1))),
                                      onPressed: () {},
                                      child: Text(
                                        'Ver todos',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(18),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0x023047).withOpacity(1),
                              ),
                              child: Column(
                                  children: travelData.travels.reversed
                                      .toList()
                                      .map((e) => RecentDestinations(
                                          id: e.id,
                                          title: e.destinyName,
                                          date: e.startTime,
                                          duration: '10min',
                                          image_url:
                                              'https://th.bing.com/th/id/R.18d6bfb1ffeb8aff520b410283862774?rik=gBoXfNLbSlM7vg&pid=ImgRaw&r=0'))
                                      .toList()),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    'Quadro de avisos',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0x023047)
                                                      .withOpacity(1))),
                                      onPressed: () {},
                                      child: Text(
                                        'Alterar preferências',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(18),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0x023047).withOpacity(1),
                              ),
                              child: Column(
                                children: [
                                  ...alertData.alerts.reversed
                                      .toList()
                                      .getRange(0, 2)
                                      .map(
                                        (alert) => Column(
                                          children: [
                                            RecentReports(
                                              title: alert.type,
                                              description: alert.description,
                                              icon: Icon(
                                                Icons.crisis_alert_sharp,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
        ));
  }
}

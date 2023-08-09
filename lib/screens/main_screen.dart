import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/providers/alerts.dart';
import 'package:maasapp/providers/auth.dart';
import 'package:maasapp/providers/travels.dart';
import 'package:maasapp/screens/create_alert_screen.dart';
import 'package:maasapp/screens/profile_screen.dart';
import 'package:maasapp/screens/travel_screen.dart';
import 'package:maasapp/widgets/recent_destinations.dart';
import 'package:maasapp/widgets/recent_reports.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen();

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<Travels>(context, listen: false).fetchAllTravels();
    await Provider.of<Alerts>(context, listen: false).fetchAllAlerts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Viajar',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.spatial_audio_off_outlined), label: 'Alertas')
          ],
          onTap: (value) {
            var routeMap = {
              0: MainScreen(),
              1: TravelScreen(),
              2: CreateAlertScreen()
            };

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => routeMap[value],
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
                  child: Consumer2<Travels, Alerts>(
                    builder: (context, travelData, alertData, _) => Container(
                      color: Color(0xe5e5e5).withOpacity(1),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () =>
                                    Provider.of<Auth>(context, listen: false)
                                        .logout(),
                                child: Text("sair")),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://th.bing.com/th/id/R.e9b7eeeaa6aa55d867dc15e6580363f6?rik=P%2bhh9uEXWRTTpg&pid=ImgRaw&r=0'),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfileScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(127)),
                                      border: Border.all(
                                          color: Colors.white30,
                                          strokeAlign: StrokeAlign.inside,
                                          width: 3),
                                      color: const Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        .27,
                                      ),
                                    ),
                                    width: 282,
                                    height: 53,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          child: Container(
                                            width: 150,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            margin: EdgeInsets.only(
                                                left: 8, top: 5),
                                            child: TextFormField(
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: 'Pesquisar',
                                                  labelStyle: TextStyle(
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.settings,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
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
                                children: [
                                  RecentDestinations(
                                    id: '1',
                                    title: 'Edifício Leste',
                                    date: DateTime.parse('2023-05-28'),
                                    duration: '1h30min',
                                    image_url:
                                        'https://th.bing.com/th/id/R.18d6bfb1ffeb8aff520b410283862774?rik=gBoXfNLbSlM7vg&pid=ImgRaw&r=0',
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  RecentDestinations(
                                    id: '2',
                                    title: 'Edifício Oeste',
                                    date: DateTime.parse('2022-05-28'),
                                    duration: '1h12min',
                                    image_url:
                                        'https://th.bing.com/th/id/R.18d6bfb1ffeb8aff520b410283862774?rik=gBoXfNLbSlM7vg&pid=ImgRaw&r=0',
                                  ),
                                ],
                              ),
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
                                  ...alertData.alerts.map(
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

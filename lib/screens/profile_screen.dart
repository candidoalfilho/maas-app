import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/providers/users.dart';
import 'package:maasapp/screens/create_alert_screen.dart';
import 'package:maasapp/screens/main_screen.dart';
import 'package:maasapp/screens/travel_screen.dart';
import 'package:maasapp/widgets/myprofileoption.dart';
import 'package:maasapp/widgets/recent_destinations.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen();

  Future<void> _refreshUser(BuildContext context) async {
    await Provider.of<Users>(context, listen: false).fetchLoggedUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xe5e5e5).withOpacity(1),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Viajar',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.spatial_audio_off_outlined), label: 'Alertas'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            )
          ],
          onTap: (value) {
            var routeMap = {
              0: MainScreen(),
              1: TravelScreen(),
              2: CreateAlertScreen(),
              3: ProfileScreen()
            };

            Navigator.pushReplacement(
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
          future: _refreshUser(context),
          builder: ((context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: (() => _refreshUser(context)),
                  child: Consumer<Users>(
                    builder: (context, userData, _) => Container(
                      margin: EdgeInsets.only(left: 20, top: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    child: Text(
                                      'C',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.loggedUser.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        userData.loggedUser.email,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MINHA CONTA',
                                      style: TextStyle(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MyProfileOption(
                                            func: null,
                                            icon: Icons.person,
                                            title: 'Meus dados',
                                            subtitle:
                                                'Minhas informações da conta',
                                          ),
                                          Divider(),
                                          MyProfileOption(
                                              func: null,
                                              icon: Icons.credit_card,
                                              title: 'Pagamentos',
                                              subtitle:
                                                  'Meus cartões e outros dados'),
                                          Divider(),
                                          MyProfileOption(
                                            func: null,
                                            icon: Icons.location_on_outlined,
                                            title: 'Endereços',
                                            subtitle:
                                                'Meus endereços cadastrados',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SERVIÇOS',
                                      style: TextStyle(),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MyProfileOption(
                                            func: null,
                                            icon: Icons.question_mark_rounded,
                                            title: 'Fale com o suporte',
                                            subtitle:
                                                'Suporte e dúvidas frequentes',
                                          ),
                                          Divider(),
                                          MyProfileOption(
                                            func: null,
                                            icon: Icons.logout,
                                            title: 'Sair',
                                            subtitle: 'Sair do App',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
        ));
  }
}

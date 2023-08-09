import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/providers/users.dart';
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
        appBar: AppBar(
          elevation: 6,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Minha conta',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(0, 255, 255, 255)
                                      .withOpacity(1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        offset: Offset(0.5, 0.5))
                                  ]),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 98,
                                    width: double.infinity,
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.oGADUQSDXKxtpZFOy0zQegHaEK?pid=ImgDet&rs=1',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 25),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white30,
                                                    width: 2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(60)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(.3),
                                                      offset: Offset(1.0, 1.0),
                                                      spreadRadius: 1,
                                                      blurRadius: 1)
                                                ]),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(60)),
                                                child: Image.network(
                                                  'https://th.bing.com/th/id/R.c50c244016c78766f218b25058827d50?rik=ES2%2fBHQn80B3xQ&riu=http%3a%2f%2fklinikamedyk.pl%2fimages%2f2018%2f07%2f04%2f1la.png&ehk=GJLJs0m6kceCnYTviE4%2f4%2bHE%2f09iwXCWPFxlfZj%2b%2ba0%3d&risl=&pid=ImgRaw&r=0',
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 120,
                                              ),
                                              Text(
                                                userData.loggedUser.name ??
                                                    'null',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 35,
                              padding: EdgeInsets.only(left: 15, top: 7),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 149, 229)),
                              child: Text(
                                'Sobre',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    width: 301,
                                    height: 28,
                                    padding: EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: TextFormField(
                                      initialValue: userData.loggedUser.email,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Senha',
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    width: 301,
                                    height: 28,
                                    padding: EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: TextFormField(
                                      initialValue: '*********',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Telefone',
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    width: 301,
                                    height: 28,
                                    padding: EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: TextFormField(
                                      initialValue: '+55 11 99999-9999',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 35,
                              padding: EdgeInsets.only(left: 15, top: 7),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 149, 229)),
                              child: Text(
                                'Preferências',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Alertas de segurança'),
                                          Switch(
                                            value: true,
                                            onChanged: (value) => {},
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Recomendações de eventos'),
                                          Switch(
                                            value: true,
                                            onChanged: (value) => {},
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Alertas de mobilidade'),
                                          Switch(
                                            value: true,
                                            onChanged: (value) => {},
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Alertas de clima'),
                                          Switch(
                                            value: true,
                                            onChanged: (value) => {},
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 35,
                              padding: EdgeInsets.only(left: 15, top: 7),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 149, 229)),
                              child: Text(
                                'Sessão',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                child: Text('Sair'),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
        ));
  }
}

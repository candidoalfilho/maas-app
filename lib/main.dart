import 'package:flutter/material.dart';
import 'package:maasapp/providers/alerts.dart';
import 'package:maasapp/providers/auth.dart';
import 'package:maasapp/providers/locations.dart';
import 'package:maasapp/providers/travels.dart';
import 'package:maasapp/providers/users.dart';
import 'package:maasapp/screens/auth_screen.dart';
import 'package:maasapp/screens/main_screen.dart';
import 'package:provider/provider.dart';

// @dart=2.9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Users>(
            update: (ctx, auth, previousData) => Users(
              auth.token,
              auth.userId,
              previousData == null ? [] : previousData.users,
            ),
          ),
          ChangeNotifierProxyProvider<Auth, Travels>(
            update: (ctx, auth, previousData) => Travels(
              auth.token,
              auth.userId,
              previousData == null ? [] : previousData.travels,
            ),
          ),
          ChangeNotifierProxyProvider<Auth, Alerts>(
            update: (ctx, auth, previousData) => Alerts(
              auth.token,
              auth.userId,
              previousData == null ? [] : previousData.alerts,
            ),
          ),
          ChangeNotifierProxyProvider<Auth, Locations>(
            update: (ctx, auth, previousData) => Locations(
              auth.token,
              auth.userId,
              previousData == null ? [] : previousData.locations,
            ),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, authData, _) => MaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Fit League',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                accentColor: Colors.white,
                fontFamily: 'Arial'),
            home: authData.isAuth
                ? MainScreen()
                : FutureBuilder(
                    future: authData.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? CircularProgressIndicator()
                            : AuthScreen(),
                  ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/providers/auth.dart';
import 'package:maasapp/screens/about_screen.dart';
import 'package:maasapp/widgets/card_button.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        elevation: 6,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardButton(
                function: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AboutScreen(),
                      transitionDuration: Duration(milliseconds: 200),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                icon: Icons.info,
                title: 'Sobre',
                subtitle: 'Informações sobre o MaasApp',
              ),
              CardButton(
                function: () {
                  Provider.of<Auth>(context, listen: false).logout();
                  Navigator.of(context).pop();
                },
                icon: Icons.logout,
                title: 'Sair do MaasApp',
                subtitle: 'Fazer logout do aplicativo',
              )
            ],
          ),
        ),
      ),
    );
  }
}

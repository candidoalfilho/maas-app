import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        elevation: 6,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/FIAP.jpg',
                              width: 80,
                              height: 50,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              'assets/images/iconLogo.jpg',
                              width: 70,
                              height: 70,
                            ),
                          ]),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MaasApp',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  'FIAP - Faculdade de Informática e Administração Paulista'),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  'Projeto final do Ano III de Sistemas de Informação'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Outubro de 2023'),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Autores:'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Cândido Alfredo'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Leonardo Lapo'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Patrick Rabello'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Luiz Eduardo'),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Renan Bernardes'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Aplicabilidade',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                      '''        O app é uma solução inovadora para quem precisa encontrar rotas eficazes em cidades, tomando por conta diversas variáveis que impactam diretamente o usuário: criminalidade no meio urbano, ruas com má infraestrutura (por exemplo, com recorrentes alagamentos) e imprevistos variados. Esses fatores são fundamentais para melhorar a experiência de diversos usuários dos sistemas de transporte, tais como motoristas de aplicativo, ambulâncias, viaturas policiais, estudantes, dentre outros.'''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

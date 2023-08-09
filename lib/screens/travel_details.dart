import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TravelDetails extends StatelessWidget {
  const TravelDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de viagem'),
        elevation: 6,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
              child: ClipRRect(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                        'https://th.bing.com/th/id/R.18d6bfb1ffeb8aff520b410283862774?rik=gBoXfNLbSlM7vg&pid=ImgRaw&r=0',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          'Av.Almirante Tamandaré 900 - Tambaú - João Pessoa - PB',
                          softWrap: true,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('1:10AM')
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.square,
                        size: 12,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          'Av.Ruy Carneiro - Tambaú - João Pessoa - PB',
                          softWrap: true,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('1:13AM'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Avalie essa trajetória',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 3,
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ajuda',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.security,
                              size: 40,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                                constraints: BoxConstraints(maxWidth: 220),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reportar problema de segurança',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Alerte algum problema de segurança',
                                      softWrap: true,
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.help_center,
                              size: 40,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                                constraints: BoxConstraints(maxWidth: 220),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Peça ajuda para viajar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Precisa de ajuda com algo mais?',
                                      softWrap: true,
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
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
    );
  }
}

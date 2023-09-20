import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maasapp/providers/alerts.dart';
import 'package:provider/provider.dart';

class CreateAlertScreen extends StatefulWidget {
  CreateAlertScreen({Key key}) : super(key: key);

  static const alertItems = [
    'Enchente',
    'Assalto',
    'Interdição',
    'Engarrafamento'
  ];

  static const importanceItems = ['Leve', 'Moderada', 'Urgente'];

  @override
  State<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  var chosenItem = CreateAlertScreen.alertItems[0];
  var chosenImportance = CreateAlertScreen.importanceItems[0];

  var locationController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registrar alerta'),
          elevation: 6,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Consumer<Alerts>(
          builder: (context, alertsData, child) => Container(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Text(
                    'Informações gerais',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Localização',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Tipo de alerta',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton<String>(
                        value: chosenItem,
                        items: CreateAlertScreen.alertItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          chosenItem = value;
                          print(chosenItem);
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Text(
                    'Informações específicas',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Descrição',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Grau de importância',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton<String>(
                        value: chosenImportance,
                        items: CreateAlertScreen.importanceItems
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          chosenImportance = value;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text("Registrar"),
                    onPressed: () {
                      var description = descriptionController.text;
                      var type = chosenItem;
                      alertsData.addAlert(description, type);
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade800)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

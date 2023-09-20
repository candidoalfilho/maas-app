import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {Key key, this.title, this.subtitle, this.icon, this.function})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.grey.shade300, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 7,
                    thickness: 3,
                    color: Colors.yellow,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              size: 45,
            )
          ],
        ),
      ),
    );
  }
}

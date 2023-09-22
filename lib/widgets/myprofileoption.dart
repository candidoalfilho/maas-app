import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyProfileOption extends StatelessWidget {
  const MyProfileOption(
      {Key key, this.icon, this.title, this.subtitle, this.func})
      : super(key: key);
  final IconData icon;
  final String title;
  final String subtitle;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 20),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(subtitle),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}

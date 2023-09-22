import 'package:flutter/material.dart';

class LocalCard extends StatelessWidget {
  const LocalCard({Key key, this.name, this.id, this.image_url})
      : super(key: key);
  final String name;
  final String id;
  final String image_url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: ClipRRect(
              child: Image.network(
                image_url,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            '5 km',
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}

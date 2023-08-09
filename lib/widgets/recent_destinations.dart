import 'package:flutter/material.dart';
import 'package:maasapp/screens/profile_screen.dart';
import 'package:maasapp/screens/travel_details.dart';

class RecentDestinations extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final String duration;
  final String image_url;

  const RecentDestinations({
    Key key,
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.duration,
    @required this.image_url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TravelDetails(),
          ),
        )
      },
      child: Container(
        height: 107,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text('${date.day}/${date.month}/${date.year}'),
                  Row(
                    children: [Icon(Icons.av_timer_rounded), Text(duration)],
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: 135,
                height: 107,
                child: Image.network(image_url, fit: BoxFit.cover),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sponsers extends StatefulWidget {
  @override
  _SponsersState createState() => _SponsersState();
}

class _SponsersState extends State<Sponsers> {
  PageController _pageController = PageController();
  List _offers = [
    {
      'image': 'assets/images/booking.png',

    },
    {
      'image': 'assets/images/airbnb.png',

    },
    {
      'image': 'assets/images/attentive.png',

    },
    {
      'image': 'assets/images/calendly.png',

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Container(
        color: Color.fromRGBO(222, 238, 254,1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                'Sponsers',
                style: TextStyle(
                    color: Color.fromRGBO(55, 120, 159, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              children: [
                ..._offers
                    .map((element) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage(element['image']),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ))
                    .toList(),
              ],
            ),
            SizedBox(
              height: 50,)
          ],
        ),
      ),
    );
  }
}

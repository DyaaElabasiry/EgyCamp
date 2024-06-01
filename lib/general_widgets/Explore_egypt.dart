import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExploreEgypt extends StatefulWidget {
  @override
  _ExploreEgyptState createState() => _ExploreEgyptState();
}

class _ExploreEgyptState extends State<ExploreEgypt> {
  PageController _pageController = PageController();
  List _offers = [
    {
      'image': 'assets/images/saint_catherine.jpeg',
      'place': 'Wadi El-Rayan',
      'governorate': 'sinai',
      'discount': '20%'
    },
    {
      'image': 'assets/images/Rayan.jpeg',
      'place': 'Wadi El-Rayan',
      'governorate': 'Fayoum',
      'discount': '20%'
    },
    {
      'image': 'assets/images/salt_lake.jpeg',
      'place': 'Wadi El-Rayan',
      'governorate': 'Fayoum',
      'discount': '20%'
    },
    {
      'image': 'assets/images/ouyoun_musa.jpeg',
      'place': 'Wadi El-Rayan',
      'governorate': 'Matrouh',
      'discount': '20%'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/explore_egypt.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Explore Egypt',
                      style: TextStyle(
                          color: Color.fromRGBO(55, 120, 159, 1),
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              Text('Enjoy what Egypt has of enchanting places that captivate.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Row(
          children: [
            ..._offers
                .map((element) => Expanded(
                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                         vertical: 20),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(element['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Text(
                        element['governorate'],
                        style: TextStyle(
                            color:
                            Color.fromRGBO(55, 120, 159, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      )),
                                ],
                              ),
                ))
                .toList(),
          ],
        ),
        SizedBox(
          height: 50,)
      ],
    );
  }
}

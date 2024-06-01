import 'package:flutter/material.dart';

class ExampleTrips extends StatefulWidget {
  @override
  _ExampleTripsState createState() => _ExampleTripsState();
}

class _ExampleTripsState extends State<ExampleTrips> {
  PageController _pageController = PageController();
  List _offers = [
    {
      'image': 'assets/images/Rayan.jpeg',
      'place': 'Wadi El-Rayan',
      'governorate': 'Fayoum',
      'discount': '20%'
    },
    {
      'image': 'assets/images/dolphin_camp.jpeg',
      'place': 'Dolphin Camp',
      'governorate': 'Sinai',
      'discount': '20%'
    },
    {
      'image': 'assets/images/saint_catherine.jpeg',
      'place': 'saint catherine',
      'governorate': 'Sinai',
      'discount': '20%'
    },
    {
      'image': 'assets/images/matrouh.jpeg',
      'place': 'Matrouh',
      'governorate': 'Matrouh',
      'discount': '20%'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ..._offers
            .map((element) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Container(
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(element['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 480,
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Text(
                                element['place'],
                                style: TextStyle(
                                    color: Color.fromRGBO(55, 120, 159, 1),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              )),
                          Expanded(child: SizedBox()),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Text(
                                element['governorate'],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
                  ],
                ))
            .toList(),
      ],
    );
  }
}

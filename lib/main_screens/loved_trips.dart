import 'package:flutter/material.dart';

import '../general_widgets.dart';
import '../general_widgets/example_trips.dart';
import '../general_widgets/top_bar.dart';

class LovedTrips extends StatefulWidget {
  @override
  State<LovedTrips> createState() => _LovedTripsState();
}

class _LovedTripsState extends State<LovedTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loved_trips.jpeg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 60),
                  child: Text(
                    'Home  >  Loved trips',
                    style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(

                    horizontal: 100,
                  ),
                  child: ExampleTrips(),
                )
              ],
            ),
            SizedBox(height: 50),
            Footer(),
          ],
        ),
      ),
    );
  }
}
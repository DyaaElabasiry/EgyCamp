import 'package:egycamp/general_widgets/see_all_offers.dart';
import 'package:flutter/material.dart';

import '../general_widgets.dart';
import '../general_widgets/example_trips.dart';
import '../general_widgets/top_bar.dart';

class OffersScreen extends StatefulWidget {
  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              height: 370,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/offers_header.jpeg'),
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
                    'Home  >  Offers',
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
                  child: SeeAllOffers(),
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
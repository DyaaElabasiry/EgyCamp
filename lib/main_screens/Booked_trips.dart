import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets/see_all_offers.dart';
import 'package:egycamp/main_screens/booked_trips_details.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';
import '../general_widgets.dart';
import '../general_widgets/example_trips.dart';
import '../general_widgets/top_bar.dart';

class BookedTripsScreen extends StatefulWidget {
  @override
  State<BookedTripsScreen> createState() => _BookedTripsScreenState();
}

class _BookedTripsScreenState extends State<BookedTripsScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List bookedTrips= UserCredentialsSingleton().getBookedTrips();
  List campId = [0, 1, 2, 3];
  String totalPrice = '100';
  int numberOfPeople = 2;
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
                  image: AssetImage('assets/images/bag.jpeg'),
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
                    'Home  >  Booket Trips',
                    style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...bookedTrips.map((bookedTrip) => FutureBuilder<QuerySnapshot>(
                    future: firestore.collection('camps').where('id', isEqualTo: bookedTrip['campId']).get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      Camp _Camp = Camp.fromJson(snapshot.data!.docs[0].data() as Map<String, dynamic>);

                      return InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookedTripsDetailsScreen(campData: _Camp, numberOfPeople: bookedTrip['numberOfPeople'],),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(

                            horizontal: 200,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                SizedBox(height: 40,),
                                Row(
                                    children:[
                                      Expanded(child: Text(
                                        'Camp',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'City',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'Start Date',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'End Date',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'Persons',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'Total Price',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Expanded(child: Text(
                                        'QR Code',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ]
                                ),SizedBox(height: 20,),
                                Container(
                                  color: Color.fromRGBO(55, 120, 159, 0.4),
                                  child: Row(
                                      children:[
                                        Expanded(child: Text(
                                          _Camp.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Text(
                                          _Camp.city,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Text(
                                          '${_Camp.startDate.day}/${_Camp.startDate.month}/${_Camp.startDate.year}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Text(
                                          '${_Camp.endDate.day}/${_Camp.endDate.month}/${_Camp.endDate.year}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Text(
                                          '${bookedTrip['numberOfPeople']}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Text(
                                          '\$${bookedTrip['totalPrice']}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Expanded(child: Container(
                                          height: 150,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/qrCode.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                      ]
                                  ),
                                )
                              ]
                          ),
                        ),
                      );
                    }
                ))
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
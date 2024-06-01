import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets/see_all_offers.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';
import '../general_widgets.dart';
import '../general_widgets/example_trips.dart';
import '../general_widgets/top_bar.dart';

class BookedTripsDetailsScreen extends StatefulWidget {
  final Camp campData;
  final int numberOfPeople;

  const BookedTripsDetailsScreen({super.key, required this.campData, required this.numberOfPeople});
  @override
  State<BookedTripsDetailsScreen> createState() => _BookedTripsDetailsScreenState();
}

class _BookedTripsDetailsScreenState extends State<BookedTripsDetailsScreen> {
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
                    'Home  >  Booked Trips > ${widget.campData.title} Details',
                    style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(height: 300,
                      width: 300,
                      decoration:BoxDecoration(
                        image: DecorationImage(
                          image:   AssetImage('assets/images/qrCode.png')
                        )
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(

                      height: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.campData.title}',style: TextStyle(color: Colors.redAccent,fontSize: 22,fontWeight: FontWeight.bold),),
                          SizedBox(height: 35,),
                          Text('${widget.campData.city}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          SizedBox(height: 35,),
                          Row(children: [
                            Text('From     ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('01/04/2024     ',style: TextStyle(color:Colors.redAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('to    ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('03/04/2024     ',style: TextStyle(color:Colors.blueAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('Remainder 2 days',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ],),
                          SizedBox(height: 35,),
                          Row(children: [
                            Text('${widget.campData.dollarPrice}\$     ',style: TextStyle(color:Colors.redAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('${numberOfPeople} persons',style: TextStyle(color:Colors.redAccent,fontSize: 17,fontWeight: FontWeight.bold),),
                          ],)

                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40 ),
                  child: Text('Description',style: TextStyle(color: Colors.redAccent,fontSize: 22,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: 1000,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40 ),
                    child: Text('${widget.campData.description}',
                      style: TextStyle(color: Colors.grey,fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 80,)


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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets/Explore_egypt.dart';
import 'package:egycamp/general_widgets/example_trips.dart';
import 'package:egycamp/general_widgets/offers.dart';
import 'package:egycamp/general_widgets/sponsers.dart';
import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:egycamp/general_widgets/trending.dart';
import 'package:egycamp/general_widgets/why_you_choose_us.dart';
import 'package:egycamp/main_screens/home_screen.dart';
import 'package:egycamp/main_screens/trip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:flutter/widgets.dart';

import '../data_model.dart';
import '../signup_screen/signin.dart';
import '../signup_screen/signup.dart';

class RegisteredScreen extends StatefulWidget {
  @override
  State<RegisteredScreen> createState() => _RegisteredScreenState();
}

class _RegisteredScreenState extends State<RegisteredScreen> {
  PageController _pageController = PageController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              color: Color.fromRGBO(222, 238, 254, 1),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore Egypt',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Enjoy ',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Text(
                              'Camping',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.redAccent),
                            ),
                          ],
                        ),
                        Text(
                          'in the deserts of Egypt',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 500,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(500),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/explore_egypt.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 60),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Home  >  All',
                      style: TextStyle(
                        color: Color.fromRGBO(55, 120, 159, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(

                    horizontal: 100,
                  ),
                  child: FutureBuilder<QuerySnapshot>(
                      future: firestore.collection('camps').limit(4).get(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Wrap(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                            Camp _camp = Camp.fromJson(data);
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Trip_details( trip_data: _camp,)));
                              },
                              child: Column(
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
                                          image: NetworkImage(_camp.campImgUrl),
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
                                              _camp.title,
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
                                              _camp.city,
                                              style: TextStyle(
                                                  fontSize: 17, fontWeight: FontWeight.w700),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }
                  ),
                )
              ],
            ),
            Offers(),
            Trending(),
            Footer()
          ],
        ),
      ),
    );
  }
}

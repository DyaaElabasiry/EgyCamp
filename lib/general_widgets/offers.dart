import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/main_screens/offers_screen.dart';
import 'package:egycamp/main_screens/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data_model.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  PageController _pageController = PageController();
  Camp _camp = Camp.fromJson(data[0]);
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
                        image: AssetImage('assets/images/Offers.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Offers',
                      style: TextStyle(
                          color: Color.fromRGBO(55, 120, 159, 1),
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OffersScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 23,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              Text('Offers and recommendations just for you',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: FutureBuilder<QuerySnapshot>(
                  future: fetchOffersData(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      child: Row(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          Camp _camp = Camp.fromJson(data);
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Trip_details(trip_data: _camp)),
                              );
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
                                SizedBox(
                                  width: 480,
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Text(
                                            _camp.city,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )),
                                      Expanded(child: SizedBox()),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Text(
                                            "Discount: 25%",
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _pageController.animateTo(
                        _pageController.position.minScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn);
                  },
                  child: Container(
                      height: 380,
                      width: 50,
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Color.fromRGBO(55, 120, 159, 1),
                      ))),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    _pageController.animateTo(
                        _pageController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn);
                  },
                  child: Container(
                      height: 380,
                      width: 50,
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Color.fromRGBO(55, 120, 159, 1),
                      ))),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

Future<QuerySnapshot> fetchOffersData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('camps')
      .where('isOffer', isEqualTo: true)
      .get();

  return querySnapshot;
}

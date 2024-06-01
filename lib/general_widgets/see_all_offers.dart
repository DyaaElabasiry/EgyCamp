import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets/trending.dart';
import 'package:egycamp/main_screens/trip_details.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';
import 'offers.dart';

class SeeAllOffers extends StatefulWidget {
  @override
  _SeeAllOffersState createState() => _SeeAllOffersState();
}

class _SeeAllOffersState extends State<SeeAllOffers> {
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
    return FutureBuilder<QuerySnapshot>(
        future: fetchOffersData(),
        builder: (context, snapshot) {
          return Wrap(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              Camp _camp = Camp.fromJson(data);
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Trip_details(trip_data: _camp),
                    ),
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
    );
  }
}




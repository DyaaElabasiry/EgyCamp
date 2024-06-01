import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets/see_all_offers.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';
import '../general_widgets.dart';
import '../general_widgets/example_trips.dart';
import '../general_widgets/top_bar.dart';
import 'trip_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    'Home  >  All',
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
                  child: SeeAllData(),
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


class SeeAllData extends StatefulWidget {
  @override
  _SeeAllDataState createState() => _SeeAllDataState();
}

class _SeeAllDataState extends State<SeeAllData> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: fetchAllData(),
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
    );
  }
}




Future<QuerySnapshot> fetchAllData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('camps')
      .get();

  return querySnapshot;
}

import 'dart:html';

import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:egycamp/main_screens/filling_info.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';

class Trip_details extends StatefulWidget {
  final Camp trip_data;

  const Trip_details({super.key, required this.trip_data});

  @override
  _Trip_detailsState createState() => _Trip_detailsState();
}

class _Trip_detailsState extends State<Trip_details> {
  @override
  Widget build(BuildContext context) {
    // Camp trip_data = Camp.fromJson(data[0]);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TopBar(),
          Stack(
            children: [
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/enjoy_your_camp.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                child: Text(
                  'Enjoy Your Camp',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home  >  Trending  >  ${widget.trip_data.city} >  ${widget.trip_data.title}',
                    style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    widget.trip_data.title,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.trip_data.city,
                    style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 400,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(widget.trip_data.campImgUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 50, horizontal: 120),
                    child: Text(
                      widget.trip_data.description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: Row(
                      children: [
                        Text(
                          'Start Date',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          'End Date',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: Row(
                      children: [
                        Text(
                          "${widget.trip_data.startDate.day}/${widget.trip_data.startDate.month}/${widget.trip_data.startDate.year}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          "${widget.trip_data.endDate.day}/${widget.trip_data.endDate.month}/${widget.trip_data.endDate.year}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Properties',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    children: widget.trip_data.properties
                        .map((property) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 20),
                              child: Text(
                                property,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Wrap(
                    children: widget.trip_data.days
                        .map((day) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(day.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    day.title,
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ...day.description
                                      .map(
                                        (description) => Text(
                                          description,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  Row(children: [
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {
                        if (UserCredentialsSingleton().getUid()!=null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FillingInfoScreen(trip_data: widget.trip_data,)));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(55, 120, 159, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              )),
        ],
      ),
    ));
  }
}

import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:egycamp/main_screens/cost_details.dart';
import 'package:egycamp/main_screens/registered_screen.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';

class FillingInfoScreen extends StatefulWidget {
  final Camp trip_data;

  const FillingInfoScreen({super.key, required this.trip_data});
  @override
  State<FillingInfoScreen> createState() => _FillingInfoScreenState();
}

class _FillingInfoScreenState extends State<FillingInfoScreen> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String username = '';
    String phoneNumber = '';
    String nationalID = '';
    String reisdenceAddress = '';
    String nationality = '';
    String numberOfPeople = '0';
    Camp trip_data = widget.trip_data;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TopBar(),
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/filling_info_1.jpeg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 150,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text('  Selected camp',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent.withOpacity(0.3),
                              ),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text('  Filling customer information',
                                style: TextStyle(color: Colors.black.withOpacity(0.3),
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent.withOpacity(0.3),
                              ),
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text('  Finalizing booking progress',
                                style: TextStyle(color: Colors.black.withOpacity(0.3),
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Selected trip information',
                      style: TextStyle(

                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('Camp',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text('City',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text('Start Date',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text('End Date',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text('Price / Foreigners',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text('Egyptian',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(trip_data.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text(trip_data.city,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text("${trip_data.startDate.day}/${trip_data.startDate.month}/${trip_data.startDate.year}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text("${trip_data.endDate.day}/${trip_data.endDate.month}/${trip_data.endDate.year}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text(trip_data.dollarPrice+" \$",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                        Expanded(child: Text(trip_data.egyPrice+" EGP",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      color: Color.fromRGBO(222, 238, 254, 0.5),
                      width: 400,
                      child: TextFormField(
                        onChanged: (value) {
                          numberOfPeople = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of people';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'number of people',
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    username = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Email Adress',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    reisdenceAddress = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your residence address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Residence Address',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisteredScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.all(30),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    nationalID = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your national ID';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'National ID',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    nationality = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your nationality';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Nationality',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Map customerData = {
                                      'email': email,
                                      'username': username,
                                      'phoneNumber': phoneNumber,
                                      'nationalID': nationalID,
                                      'reisdenceAddress': reisdenceAddress,
                                      'nationality' : nationality,
                                      'numberOfPeople' : numberOfPeople,
                                      'campId': trip_data.id,
                                      'dollarPrice': trip_data.dollarPrice,
                                    };
                                    print(customerData);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CostDetailsScreen(customerData: customerData),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.all(30),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

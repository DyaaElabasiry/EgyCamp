import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'registered_screen.dart';

import '../data_model.dart';

class BookingIsDoneScreen extends StatefulWidget {

  @override
  State<BookingIsDoneScreen> createState() => _BookingIsDoneScreenState();
}

class _BookingIsDoneScreenState extends State<BookingIsDoneScreen> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent),),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/booking_is_done.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Here is your QR code save it',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/qrCode.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisteredScreen(),
                  ),
                );
              },
              child:Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

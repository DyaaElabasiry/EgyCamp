import 'package:egycamp/main_screens/registered_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EgyCampLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisteredScreen()),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Egy',
                  style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
              Text('camp',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            ],
          )),
    );
  }
}

class EgyCampLogoLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Egy',
                style: TextStyle(
                    color: Color.fromRGBO(55, 120, 159, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.w900)),
            Text('camp',
                style: TextStyle(fontSize: 31,color: Colors.white, fontWeight: FontWeight.w700)),
          ],
        ));
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(38, 50, 56, 1),
      height: 400,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                EgyCampLogoLight(),
                SizedBox(height: 50,),
                Text("Copyright © 2024 EgyCamp. \nAll rights reserved.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.facebook_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.facebook_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.facebook_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
                            ],
                          ),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                            Text("Company",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
                            SizedBox(height: 25,),
                            Text("About Us",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Blog",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Contact Us",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Pricing",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Testimonials",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                          ]),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                            Text("Support",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
                      SizedBox(height: 25,),
                            Text("Help Center",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Terms of service",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Legal",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Privacy policy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 10,),
                            Text("Status",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
                          ]),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(children: [

                  Text("Powered By",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700)),
                  Row(

                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage('assets/images/booking.png'))),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 150,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage('assets/images/calendly.png'))),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/images/airbnb.png'))),
                    ),
                  ),


                ]),
              )),
        ],
      ),
    );
  }
}

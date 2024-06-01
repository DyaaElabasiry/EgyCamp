import 'package:egycamp/general_widgets/Explore_egypt.dart';
import 'package:egycamp/general_widgets/offers.dart';
import 'package:egycamp/general_widgets/sponsers.dart';
import 'package:egycamp/general_widgets/trending.dart';
import 'package:egycamp/general_widgets/why_you_choose_us.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:flutter/widgets.dart';

import '../signup_screen/signin.dart';
import '../signup_screen/signup.dart';

class UnregisteredScreen extends StatefulWidget {
  @override
  State<UnregisteredScreen> createState() => _UnregisteredScreenState();
}

class _UnregisteredScreenState extends State<UnregisteredScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(child: Container(
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
                      ))),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Text(
                              'Offers',
                              style: TextStyle(
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Text(
                              'Trending',
                              style: TextStyle(
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Text(
                              'Explore Egypt',
                              style: TextStyle(
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Text(
                              'Why You Choose Us',
                              style: TextStyle(
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_circle_sharp,
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                ),
                                Text(
                                  '  Sign in',
                                  style: TextStyle(
                                      color: Color.fromRGBO(55, 120, 159, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromRGBO(222, 238, 254, 1),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Siwa Oasis',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black87),
                            ),
                            Text(
                              'Enjoy Swimming in Siwa lakes one of the best destinations in Egypt',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(55, 120, 159, 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Enroll',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 500,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(500),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/salt_lake.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Offers(),
            Trending(),
            ExploreEgypt(),
            ChooseUs(),
            Sponsers(),
            Footer(),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChooseUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Why you',
                  style: TextStyle(
                      color: Color.fromRGBO(55, 120, 159, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
              Text(
                ' choose us',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/choose_us_1.jpeg'),
                    fit: BoxFit.cover,

                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Text('1.',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 61, 0, 0.85),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Diverse Camping Destinations',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(55, 120, 159, 1)),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Explore the breathtaking landscapes of Egyptwith our carefully curated selection of diversecamping destinations.From pristine beachesto picturesque deserts and lush oases,we offer a range of locations to suit everycamper's preference.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 61, 0, 0.85)),
                          ),
                        ],
                      ),
                    ),
                  ],


                ),
              ),
            ),

          ],),
        SizedBox(
          height: 80,
        ),
        Row(
          children: [

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Text('2.',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 61, 0, 0.85),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'User-Friendly Booking Process',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(55, 120, 159, 1)),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Planning your camping adventure is easy with our user-friendly booking platform.Browse through our options, select your preferred dates, and secure your spotwith a few simple clicks.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 61, 0, 0.85)),
                          ),
                        ],
                      ),
                    ),
                  ],


                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/choose_us_2.jpeg'),
                    fit: BoxFit.cover,

                  ),
                ),
              ),
            ),
          ],),
        SizedBox(
          height: 80,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/choose_us_3.jpeg'),
                    fit: BoxFit.cover,

                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Text('3.',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 61, 0, 0.85),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Expertly Curated Camping Packages',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(55, 120, 159, 1)),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Our team of experienced campers and travelenthusiasts has crafted thoughtfully curatedcamping packages. Whether you're a soloadventurer, a couple seeking a romanticgetaway, or a family planning a fun-filledvacation, we have the perfect package for you.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 61, 0, 0.85)),
                          ),
                        ],
                      ),
                    ),
                  ],


                ),
              ),
            ),

          ],),
      ],
    );
  }
}

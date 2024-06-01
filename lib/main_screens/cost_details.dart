import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:egycamp/main_screens/booking_is_done.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';

class CostDetailsScreen extends StatefulWidget {
  final Map customerData;

  const CostDetailsScreen({super.key, required this.customerData});
  @override
  State<CostDetailsScreen> createState() => _CostDetailsScreenState();
}

class _CostDetailsScreenState extends State<CostDetailsScreen> {
  int discount = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    int campId = widget.customerData['campId'];
    int number_of_people = int.parse(widget.customerData['numberOfPeople']);
    String dollarPrice = widget.customerData['dollarPrice'];

    String coupon = '';
    var totalPrice = number_of_people * int.parse(dollarPrice) * (1-discount/100);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/filling_info_2.jpeg'),
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
                              color: Colors.redAccent,
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
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('  Finalizing booking progress',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(200),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Apply ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Coupons',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: _formKey,
                          child: Row(children: [
                            Container(
                              width: 300,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  coupon = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your coupon code';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your coupon code',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if(coupon=='egycamp'){
                                  setState(() {
                                    discount = 25;
                                  });
                                }else{setState(() {
                                    discount = 0;
                                });}
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sub Total',
                                    style: TextStyle(
                                        color: Color.fromRGBO(55, 120, 159, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Sub Total',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(55, 120, 159, 0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Number of Persons ${number_of_people}',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(55, 120, 159, 0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Coupon',
                                    style: TextStyle(
                                        color:
                                            Colors.redAccent.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 35,
                                ),
                                Text('Total',
                                    style: TextStyle(
                                        color: Color.fromRGBO(55, 120, 159, 1),
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cost',
                                    style: TextStyle(
                                        color: Color.fromRGBO(55, 120, 159, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('${dollarPrice} \$',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(55, 120, 159, 0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    '${number_of_people * int.parse(dollarPrice)} \$',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(55, 120, 159, 0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("${discount} %",
                                    style: TextStyle(
                                        color:
                                            Colors.redAccent.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                    '${totalPrice} \$',
                                    style: TextStyle(
                                        color: Color.fromRGBO(55, 120, 159, 1),
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                FirebaseFirestore db = FirebaseFirestore.instance;
                                FirebaseFirestore.instance.collection('users').doc(UserCredentialsSingleton().getUid()).update({
                                  'bookedTrips': FieldValue.arrayUnion([{
                                    'numberOfPeople': number_of_people,
                                    'totalPrice': totalPrice,
                                    'campId':2,
                                  }])
                                });
                                UserCredentialsSingleton().updateBookedTrips({
                                  'numberOfPeople': number_of_people,
                                  'totalPrice': totalPrice,
                                  'campId':2,
                                });
                                showDialog(context: context, builder: (context){
                                  return BookingIsDoneScreen();
                                });
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
                                    'Book Now',
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
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

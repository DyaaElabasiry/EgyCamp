import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/signup_screen/functions.dart';
import 'package:egycamp/signup_screen/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main_screens/registered_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _checkboxvalue = false;
  String email = '';
  String password = '';
  String username = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(20), child: EgyCampLogo()),
                Row(children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Get Started Now',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900)),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Name',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 45,
                          child: TextFormField(
                            onChanged: (value) {
                              username = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'user name is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter your name',
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Email address',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 45,
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter your email',
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Password',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 45,
                          child: TextFormField(
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          Checkbox(
                              value: _checkboxvalue,
                              onChanged: (value) {
                                setState(() {
                                  _checkboxvalue = !_checkboxvalue!;
                                });
                              }),
                          Text('   I agree to the '),
                          Text('terms & policy',
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                        ]),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                var userCredentials =
                                    await registerUser(email, password,username, context);

                                if (userCredentials != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisteredScreen()),
                                  );
                                  print(userCredentials.user!.email);
                                  print('User Registered');
                                }
                              }
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(55, 120, 159, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              width: double.maxFinite,
                              color: Colors.black12,
                            ),
                          ),
                          const Text(
                            '  or  ',
                            style: TextStyle(),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              width: double.maxFinite,
                              color: Colors.black12,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.only(right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      ' Facebook',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black12, width: 2)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.only(left: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "G",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      '  Google',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black12, width: 2)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            const Text(
                              'have an account?  ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SigninScreen()));
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(55, 120, 159, 1)),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ])
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/signup_pyramids.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

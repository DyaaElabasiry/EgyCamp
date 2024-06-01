import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/general_widgets/top_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signup_screen/functions.dart';

class ManageAccountScreen extends StatefulWidget {
  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String username = '';
    String phoneNumber = '';
    String nationalID = '';
    String reisdenceAddress = '';
    String nationality = '';
    String currentPassword = '';
    String newPassword = '';
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  image: AssetImage('assets/images/user_profile.jpeg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 150,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home  >  user profile',
                      style: TextStyle(
                        color: Color.fromRGBO(55, 120, 159, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    currentPassword = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your current password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Current Password',
                                    labelStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  if(currentPassword != null && newPassword != null)
                                    _changePassword(currentPassword, newPassword,context);
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
                                      'Change Password',
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
                              Container(
                                margin: EdgeInsets.all(30),
                                color: Color.fromRGBO(222, 238, 254, 0.5),
                                child: TextFormField(
                                  onChanged: (value) {
                                    newPassword = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your new password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'New Password',
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
                                    var userCredentialsSingleton =
                                        UserCredentialsSingleton();
                                    String uid =
                                        userCredentialsSingleton.getUid();
                                    FirebaseFirestore db =
                                        FirebaseFirestore.instance;
                                    db.collection('users').doc(uid).update({
                                      'email': email,
                                      'username': username,
                                      'phoneNumber': phoneNumber,
                                      'nationalID': nationalID,
                                      'residenceAddress': reisdenceAddress,
                                      'nationality': nationality,
                                    });
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
                                      'Save Changes',
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
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

void _changePassword(String currentPassword, String newPassword,BuildContext context) async {
  final user = await FirebaseAuth.instance.currentUser;
  String? email = user?.email;

  if (user != null && email != null) {
    print(email);
    final cred = EmailAuthProvider.credential(
        email: email, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    });
  }
}

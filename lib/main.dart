import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egycamp/data_model.dart';
import 'package:egycamp/general_widgets.dart';
import 'package:egycamp/general_widgets/example_trips.dart';
import 'package:egycamp/main_screens/Booked_trips.dart';
import 'package:egycamp/main_screens/booked_trips_details.dart';
import 'package:egycamp/main_screens/cost_details.dart';
import 'package:egycamp/main_screens/filling_info.dart';
import 'package:egycamp/main_screens/home_screen.dart';
import 'package:egycamp/main_screens/loved_trips.dart';
import 'package:egycamp/main_screens/trip_details.dart';
import 'package:egycamp/main_screens/unregistered_screen.dart';
import 'package:egycamp/main_screens/user_profile.dart';
import 'package:egycamp/signup_screen/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:egycamp/signup_screen/signup.dart';

import 'firebase_options.dart';
import 'main_screens/registered_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // print(findAnomaly(data));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnregisteredScreen(),


    );
  }
}

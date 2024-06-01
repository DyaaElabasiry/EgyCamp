import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<UserCredential?> registerUser(String email, String password,
    String username, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var userCredentialsSingleton = UserCredentialsSingleton();
    userCredentialsSingleton.setUserCredentials(
        email: email,
        username: username,
        uid: userCredential.user!.uid,
        lovedTrips: [],
        bookedTrips: []);
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'username': username,
      'lovedTrips': [],
      'bookedTrips': [],
    });
    return userCredential;
  } on FirebaseAuthException catch (e) {
    // If the form is valid, display a Snackbar.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.code)),
    );
  } catch (e) {
    print(e);
  }
}

Future<UserCredential?> signInUser(
    String email, String password, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot =
        await db.collection('users').doc(userCredential.user!.uid).get();
    var userCredentialsSingleton = UserCredentialsSingleton();
    userCredentialsSingleton.setUserCredentials(
      email: email,
      username: documentSnapshot['username'],
      uid: userCredential.user!.uid,
      lovedTrips: documentSnapshot['lovedTrips'],
      bookedTrips: documentSnapshot['bookedTrips'],
    );
    print(documentSnapshot['bookedTrips']);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.code)),
    );
  } catch (e) {
    print(e);
  }
}

class UserCredentialsSingleton {
  static final UserCredentialsSingleton _singleton = UserCredentialsSingleton._internal();

  String? email;
  String? username;
  String? uid;
  List lovedTrips = [];
  List bookedTrips = [];
  factory UserCredentialsSingleton() {
    return _singleton;
  }

  UserCredentialsSingleton._internal();

  void setUserCredentials({required String email, required String username, required String uid, required List lovedTrips,required List bookedTrips}) {
    this.email = email;
    this.username = username;
    this.uid = uid;
    this.lovedTrips = lovedTrips;
    this.bookedTrips = bookedTrips;
  }

  String? getEmail() {
    return this.email;
  }

  String? getUsername() {
    return this.username;
  }

  String getUid() {
    return this.uid!;
  }

  List getLovedTrips() {
    return this.lovedTrips;
  }
  List getBookedTrips() {
    return this.bookedTrips;
  }
  void updateBookedTrips(Map trip){
    this.bookedTrips.add(trip);
  }
}

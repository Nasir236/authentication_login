import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Adduser data save to Firebase
  addUser() {
    FirebaseFirestore.instance
        .collection('user')
        .add({"name": "Nasir", "contact": "03408587236", "country": "Pakistan"})
        .then((Value) => print("$Value Done"))
        .onError((error, stackTrace) => print("$error"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("HomeScreen")),
          SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              addUser();
            },
            child: Text("Add User"),
          ),
        ],
      ),
    );
  }
}

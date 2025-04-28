import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("HomeScreen")),
          SizedBox(height: 14),
          InkWell(
            onTap: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}

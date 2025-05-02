import 'package:flutter/material.dart';

class FutureVsStream extends StatefulWidget {
  const FutureVsStream({super.key});

  @override
  State<FutureVsStream> createState() => _FutureVsStreamState();
}

class _FutureVsStreamState extends State<FutureVsStream> {
  // Future Function
  Future<int> futureCall() async {
    int counter = 3;
    await Future.delayed(Duration(seconds: 4));
    return counter * counter;
  }

  //Stream Function
  Stream<int> streamCall() async* {
    int number = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      yield number++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder(
              future: futureCall(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Future: ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 45),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),

          // StreamBuilder
          Center(
            child: StreamBuilder(
              stream: streamCall(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Stream: ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 45),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            SpinKitSquareCircle(
              color: Colors.blueGrey[800],
              size: 100,
              duration: Duration(seconds: 4),
            ),
            Text("\n Getting News, Please Wait...."),
          ],
        ),
      ),
    );//
  }
}

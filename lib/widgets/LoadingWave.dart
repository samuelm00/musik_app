import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: SpinKitCircle(
          size: 80.0,
          color: Color.fromARGB(255, 54, 69, 143),
        ),
      ),
    );
  }
}

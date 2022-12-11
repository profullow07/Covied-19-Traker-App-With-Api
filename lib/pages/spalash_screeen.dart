import 'dart:async';

import 'package:covied_19/pages/covid_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CoviedScreen()));
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sheigth = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AnimatedBuilder(
          animation: controller,
          child: Center(
            child: Image.asset(
              "lib/images/virus.png",
              height: swidth * 0.80,
              width: swidth * 0.80,
            ),
          ),
          builder: ((BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: controller.value * 2.0 * math.pi,
              child: child,
            );
          }),
        ),

        ///logo text code
        Center(
          child: Text(
            "Covid 19\nTraker App",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:uts/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const Material3BottomNav()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Lottie.asset('assets/splash/Animation - 1722429346655.json'),
          ),
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 30.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         CircularProgressIndicator(
          //           valueColor: AlwaysStoppedAnimation(Colors.black),
          //         ),
          //         SizedBox(height: 10.0),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

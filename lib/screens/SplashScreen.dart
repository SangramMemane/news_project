import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_project/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    // });

    // Navigate to the main screen after a delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/splash_pic.jpeg",
              fit: BoxFit.cover,
              height: height * .5,
              width: width,),
              SizedBox(height: height * .04,),
              Text("TOP HEADLINES",textDirection: TextDirection.ltr, style: GoogleFonts.anton(letterSpacing:.6, color:Colors.blue.shade700)),
              SizedBox(height: height * .04,),
              SpinKitChasingDots(color: Colors.blue, size: 60,)

            ],
          ),
        ),
    );
  }
}

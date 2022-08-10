import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Screens/auth/authentification.dart';
import 'package:google_fonts/google_fonts.dart';

class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {

  @override
  void initState() {
    // TODO: implement initState
      Timer(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Authentification()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child:Text("Factorisation",style: GoogleFonts.abhayaLibre(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 38 ),)),
    );
  }
}


import 'dart:async';
import 'package:flutter/material.dart';


class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


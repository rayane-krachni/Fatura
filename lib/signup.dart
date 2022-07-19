import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Theme/Theme.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: _height*0.1,),

                Container(
                  width: _width,
                  height: _height*0.3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/signin.png')
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text('Inscription',style: ThemeStyle.initialtitle,),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(

                      height: _height*0.062,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [BoxShadow(
                              blurRadius:5 ,
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0,3)
                          )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Nom ",
                              suffixIcon: Icon(Icons.person,size: 18,)
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(

                      height: _height*0.062,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [BoxShadow(
                              blurRadius:5 ,
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0,3)
                          )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Tele phone ",
                              suffixIcon: Icon(Icons.phone,size: 18,)
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Container(

                      height: _height*0.062,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [BoxShadow(
                              blurRadius:5 ,
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0,3)
                          )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "mot de pass",
                              suffixIcon: Icon(Icons.code,size: 18,)
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 20,),
                Container(
                  width: _width,
                  height: _height*0.063,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),


                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.teal,
                        Colors.tealAccent,
                      ],
                    ),  ),

                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomePage()));

                      },

                      style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                      child: Center(child: Text("Registrer",style: ThemeStyle.buttontext,))
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Screens/auth/signup.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Querries/sharedpref.dart';



class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
 TextEditingController? name,password;
 bool? visible;


 @override
  void initState()  {

   name= TextEditingController();
   password=TextEditingController();
   visible=false;
    // TODO: implement initState
    super.initState();
  }

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
                SizedBox(height: _height*0.15,),

                Container(
                  width: _width,
                  height: _height*0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.png')
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text('Connexion',style: ThemeStyle.initialtitle,),
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
                          controller: name,
                          decoration: const InputDecoration(
                              hintText: "Nom d'utilisateur",
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
                          obscureText: visible! ? false :true ,
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Mot de pass",
                              suffixIcon: GestureDetector(
                                onTap:(){

                                  visible=!visible!; },

                                  child:visible! ? Icon(Icons.lock_open ,size: 18,):Icon(Icons.lock ,size: 18,))
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
                      onPressed: () async {
                        if(name!.text.isNotEmpty &&  password!.text.isNotEmpty)
                          {

                            if((name!.text == 'krachni lahcen')&(password!.text == 'krachni123') ){
                              Prefs.setBool('log', true);
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomePage()));
                            }
                          }

                        else{

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(' incorrect information ')));
                        }

                      },

                      style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                      child: Center(child: Text("Connecter",style: ThemeStyle.buttontext,))
                  ),
                ),
                SizedBox(height: 20,),
               /* FlatButton(onPressed:()=>{
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const SignUp()))
                }, child: Text("je n'ai pas un compte ?"))*/

              ],
            ),
          ),
        ),
      ),
    );
  }
}


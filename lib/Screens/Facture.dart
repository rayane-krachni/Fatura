
import 'package:flutter/material.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Facture extends StatefulWidget {
  const Facture({Key? key}) : super(key: key);

  @override
  State<Facture> createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Session des Factures  !",style: GoogleFonts.adamina(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20 ),)),
                //IconButton(icon:Icon(Icons.add_circle_outlined,size: 33,color: Colors.teal,), onPressed: () {  },)
              ],
            ),
            const SizedBox(height: 5,),
            Text("Dans cette vous pouvez consulter , modifier et suprimer ou bien gerer votre factures:",style: GoogleFonts.alef(color: Colors.black54,fontWeight:FontWeight.bold,fontSize: 14 ),),
            const SizedBox(height: 20,),
            Container(
              height: _height*0.3,
              width: _width,
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(const Radius.circular(10)),
                  boxShadow: [BoxShadow(
                      blurRadius:5 ,
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0,3)
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Les bonnes des Factures",style: ThemeStyle.initialtitle)),
                      const SizedBox(height: 10,),
                      Text(" Vous pouvez consulter ou bien Creer des  nouveaux Factures ",style: ThemeStyle.secondtitle,),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: _height*0.1,
                                width: _width*0.4,

                                child: Column(
                                  children:  [
                                    const Icon(Icons.fact_check_outlined,color: Colors.grey,size: 33,),
                                    const SizedBox(height: 10,),
                                    Text("Consultation",style: GoogleFonts.lato(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 14 )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _height*0.1,
                                width: _width*0.4,
                                child:  Column(
                                  children:  [
                                    const Icon(Icons.post_add,color: Colors.grey,size: 35,),
                                    const SizedBox(height: 10,),
                                    Text("Creations",style: GoogleFonts.lato(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 14 )),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],),
                      ),




                    ],

                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: _height*0.3,
              width: _width,
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(
                      blurRadius:5 ,
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0,3)
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Les bonnes des Livraisons",style: GoogleFonts.lato(color: Colors.teal,fontWeight:FontWeight.bold,fontSize: 18 ),)),
                      const SizedBox(height: 10,),
                      Text(" Vous pouvez consulter ou bien Creer des  nouveaux Bonnes ",style: GoogleFonts.alef(color: Colors.black54,fontWeight:FontWeight.bold,fontSize: 14 ),),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: _height*0.1,
                                  width: _width*0.4,

                                  child: Column(
                                      children:  [
                                        const Icon(Icons.fact_check_outlined,color: Colors.grey,size: 33,),
                                        const SizedBox(height: 10,),
                                        Text("Consultation",style: GoogleFonts.lato(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 14 )),
                                      ],
                                    ),
                                  ),
                              Container(
                                  height: _height*0.1,
                                  width: _width*0.4,
                                  child:  Column(
                                      children:  [
                                        const Icon(Icons.post_add,color: Colors.grey,size: 35,),
                                        const SizedBox(height: 10,),
                                        Text("Creations",style: GoogleFonts.lato(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 14 )),
                                      ],
                                    ),
                                  ),
                            ],
                          )
                        ],),
                      ),




                    ],

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


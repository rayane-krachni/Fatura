import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDetail extends StatefulWidget {
  Client_Model? client;
  ClientDetail({Key? key,this.client}) : super(key: key);

  @override
  _ClientDetailState createState() => _ClientDetailState();
}

class _ClientDetailState extends State<ClientDetail> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeStyle.scaffoldBgColor,
      appBar: AppBar(
        elevation: 0,
        //iconTheme: IconThemeData(color: Colors.teal),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: _height*0.3,

              decoration: const BoxDecoration(
                color:Colors.teal ,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )
              ),
              child:  Align(
                alignment:Alignment.topCenter,
                child: Text('Les Details des Clients',style: GoogleFonts.lato(color: Colors.white,fontSize: 19 ),),),
            ),
          ),
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: _width,
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [BoxShadow(
                        blurRadius:5 ,
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0,3)
                    )]
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 20,),
                      const Center(

                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/client.jpg",),
                          radius: 45,),
                      ),
                      Center(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.client!.fullname!,style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.bold ),),
                        ),
                      ),

                      const Divider(
                        color: Colors.teal,
                        height: 17,
                        endIndent:20,
                        indent: 20,
                      ),
                      SizedBox(height: 10,),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.teal,),
                          SizedBox(width: 10,),
                          Text('Nom De Client',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.client!.fullname!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.teal,),
                          SizedBox(width: 10,),
                          Text('Num de Telephone',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.client!.telephone!.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.teal,),
                          SizedBox(width: 10,),
                          Text('Address',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.client!.address!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.teal,),
                          SizedBox(width: 10,),
                          Text('Nom De Willaya',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.client!.willaya!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,size: 20,color: Colors.teal,),
                          SizedBox(width: 10,),
                          Text('Activite',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.client!.activite!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,size: 20,color: Colors.teal,),
                            SizedBox(width: 10,),
                            Text('Num Nif',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                          ],
                        ),
                      SizedBox(height: 5),
                      Text(widget.client!.nif!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,size: 20,color: Colors.teal,),
                            SizedBox(width: 10,),
                            Text('Num Nic',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                          ],
                        ),
                      SizedBox(height: 5),
                      Text(widget.client!.nic!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,size: 20,color: Colors.grey,),
                            SizedBox(width: 10,),
                            Text('Num Rc',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                          ],
                        ),
                      SizedBox(height: 5),
                      Text(widget.client!.rc!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,size: 20,color: Colors.teal,),


                            Text('Num Art',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                            SizedBox(width: 10,),

                          ],
                        ),
                      SizedBox(height: 5),
                      Text(widget.client!.art!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                        style: GoogleFonts.lato(color: Colors.black,fontSize: 14 , fontWeight: FontWeight.normal ),),



                    ],

              ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
* Container(
                      width: _width,
                      //color: Colors.black,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 47.0),
                              child: Column(
                                children: const [
                                  Icon(Icons.person,size: 20,color: Colors.teal,),
                                  SizedBox(height: 4,width: 5,),
                                  Icon(Icons.location_city,size: 18,color: Colors.teal,),
                                  SizedBox(height: 5,width: 5,),
                                  Icon(Icons.add_location_rounded,size: 18,color: Colors.teal,),
                                  SizedBox(height:5,width: 5,),
                                  Icon(Icons.phone,size: 18,color: Colors.teal,),
                                  SizedBox(height: 7,width: 5,),
                                  Icon(Icons.phone,size: 18,color: Colors.teal,),
                                  SizedBox(height:7,width: 5,),
                                  Icon(Icons.phone,size: 18,color: Colors.teal,),
                                  SizedBox(height: 7,width: 5,),
                                  Icon(Icons.phone,size: 18,color: Colors.teal,),
                                  SizedBox(height: 7,width: 5,),
                                  Icon(Icons.phone,size: 18,color: Colors.teal,),
                                ],
                              ),
                            ),
                            Container(
                              width: _width*0.7,
                              //color: Colors.teal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                    SizedBox(height: 3),
                                 SizedBox(height: 3),
                                  SizedBox(height: 3),
                                 SizedBox(height: 3),
                                    SizedBox(height: 3),
                                  Text(widget.client!.art!,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines:2,
                                    style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.normal ),),
                                  SizedBox(height: 3),
                                  Text(widget.client!.nif!,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines:2,
                                    style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.w600 ),),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )*/
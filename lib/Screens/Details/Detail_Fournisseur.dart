import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Screens/Fournisseur.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

class FournisseurDetail extends StatefulWidget {
  Fournisseur_Model? fournisseur;
  FournisseurDetail({Key? key,this.fournisseur}) : super(key: key);

  @override
  _FournisseurDetailState createState() => _FournisseurDetailState();
}

class _FournisseurDetailState extends State<FournisseurDetail> {
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
                          child: Text(widget.fournisseur!.fullname!,style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.bold ),),
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
                          Text('Nom De Foutnisseur',style: GoogleFonts.lato(color: Colors.black,fontSize:14 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.fournisseur!.fullname!,
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
                      Text(widget.fournisseur!.telephone!.toString(),
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
                      Text(widget.fournisseur!.address!,
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
                      Text(widget.fournisseur!.willaya!,
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
                      Text(widget.fournisseur!.activite!,
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
                      Text(widget.fournisseur!.nif!,
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
                      Text(widget.fournisseur!.nic!,
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
                      Text(widget.fournisseur!.rc!,
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
                      Text(widget.fournisseur!.art!,
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

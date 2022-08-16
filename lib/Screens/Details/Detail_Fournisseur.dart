import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Screens/Fournisseur.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/ritch_text.dart';

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
                child: Text('Les Details de Fournisseur ',style: GoogleFonts.lato(color: Colors.white,fontSize: 19 ),),),
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
                      Center(child: Ritch_Text(title: 'Nom de Fournissseur',detail: widget.fournisseur!.fullname!,icon: Icons.production_quantity_limits,)),
                      SizedBox(height: 5),
                     Center(child: Ritch_Text(title: 'Num de Telephone',detail: widget.fournisseur!.telephone!.toString(),icon: Icons.phone,)),
                      SizedBox(height: 5),
                      Center(child: Ritch_Text(title: 'Address',detail:'',icon: Icons.location_on,)),
                      SizedBox(height: 5),
                      Text(widget.fournisseur!.address!,overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines:3,
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),     softWrap: true,
                      ),
                      Center(child: Ritch_Text(title: 'Nom De Willaya',detail:widget.fournisseur!.willaya!,icon: Icons.location_on,)),
                      SizedBox(height: 5),
                     Center(child: Ritch_Text(title: 'Activite',detail:'',icon: Icons.production_quantity_limits,)),
                      SizedBox(height: 5),
                      Text(widget.fournisseur!.activite!,overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines:3,
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),     softWrap: true,
                      ),
                      SizedBox(height: 5),
                      Center(child: Ritch_Text(title: 'Nif',detail:widget.fournisseur!.nif!,icon: Icons.code,)),
                      SizedBox(height: 5),
                      Center(child: Ritch_Text(title: 'Nic',detail:widget.fournisseur!.nic!,icon: Icons.code,)),
                      SizedBox(height: 5),
                      Center(child: Ritch_Text(title: 'Art',detail:widget.fournisseur!.art!,icon: Icons.code,)),
                      SizedBox(height: 5),
                      Center(child: Ritch_Text(title: 'Rc',detail:widget.fournisseur!.rc!,icon: Icons.code,)),
                      SizedBox(height: 20),






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

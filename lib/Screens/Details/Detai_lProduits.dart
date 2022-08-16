import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/ritch_text.dart';

class ProduitDetail extends StatefulWidget {
  Produit_Model? produit;
  ProduitDetail({Key? key,this.produit}) : super(key: key);

  @override
  _ProduitDetailState createState() => _ProduitDetailState();
}

class _ProduitDetailState extends State<ProduitDetail> {
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
                child: Text('Les Details de Produit',style: GoogleFonts.lato(color: Colors.white,fontSize: 19 ),),),
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
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 20,),
                      const Center(

                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/images/box.png",),
                          radius: 40,),
                      ),
                      Center(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.produit!.name!,style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.bold ),),
                        ),
                      ),

                      const Divider(
                        color: Colors.teal,
                        height: 17,
                        endIndent:20,
                        indent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Center(child: Ritch_Text(title: 'Designation du Produit',detail: widget.produit!.name!,icon: Icons.production_quantity_limits,)),
                            SizedBox(height: 5),
                            Center(child: Ritch_Text(title: 'Code du Produit',detail: widget.produit!.code!,icon: Icons.code,)),
                            SizedBox(height: 5),
                            Center(child: Ritch_Text(title: 'Prix du Produit',detail: widget.produit!.prix.toString(),icon: Icons.production_quantity_limits,)),
                            SizedBox(height: 5),
                            Center(child: Ritch_Text(title: 'Tva du Produit',detail: widget.produit!.tva!.toString(),icon: Icons.production_quantity_limits,)),
                            SizedBox(height: 5),
                            Center(child: Ritch_Text(title: 'Stock du Produit',detail:widget.produit!.stock!.toString(),icon: Icons.production_quantity_limits,)),
                            SizedBox(height: 30,),

                          ],
                        ),
                      )




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

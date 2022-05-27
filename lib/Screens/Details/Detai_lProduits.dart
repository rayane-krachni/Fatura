import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          child: Text(widget.produit!.name!,style: GoogleFonts.lato(color: Colors.black,fontSize: 16 , fontWeight: FontWeight.bold ),),
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
                      Text(widget.produit!.name!,
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
                      Text(widget.produit!.code!,
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
                      Text(widget.produit!.stock!.toString(),
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
                      Text(widget.produit!.prix!.toString(),
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
                      Text(widget.produit!.tva!.toString(),
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

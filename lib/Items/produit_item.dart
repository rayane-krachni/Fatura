import 'package:flutter/material.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Screens/Details/Detai_lProduits.dart';
import 'package:google_fonts/google_fonts.dart';

class ProduitsItem extends StatefulWidget {
  Produit_Model? produit;
  ProduitsItem({Key? key, this.produit}) : super(key: key);

  @override
  _ProduitsItemState createState() => _ProduitsItemState();
}

class _ProduitsItemState extends State<ProduitsItem> {

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProduitDetail(produit: widget.produit! )))
      },
      child: Padding(
        padding: const EdgeInsets.all( 5.0),
        child: Container(

          height: _height*0.05,
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(
                  blurRadius:5 ,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0,3)
              )]
          ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.more_vert)
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/box.png",),
                        radius: 27,
                      ),
                      SizedBox(height: 10,),
                      Text(widget.produit!.name!,style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

                    ],
                  ),

                  FlatButton(onPressed: ()=> {}, child:  Text("Detail",style: GoogleFonts.lato(color:Colors.teal,fontSize: 13,fontWeight: FontWeight.bold ),))

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}

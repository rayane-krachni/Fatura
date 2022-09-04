import 'package:flutter/material.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/Screens/Details/Detai_lProduits.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/Screens/Editting/produit_edit.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:google_fonts/google_fonts.dart';

class ProduitsItem extends StatefulWidget {
  Produit_Model? produit;
  ProduitsItem({Key? key, this.produit}) : super(key: key);

  @override
  _ProduitsItemState createState() => _ProduitsItemState();
}

class _ProduitsItemState extends State<ProduitsItem> {
  void Delete_Product()async {

    int insrtcleint=   await ProduitSession.DeleteProduit(widget.produit!.id!);
    if( insrtcleint!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Ce item est supprimé",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }
  @override
  Widget build(BuildContext context) {

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
                          IconButton(
                              onPressed: (){
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 230,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      //color: Colors.amber,
                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(height: 5,),
                                          GestureDetector(
                                            onTap:(){
                                              Delete_Product();
                                            },
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),


                                              ),
                                              child:const Center(child: Text('Supprimer ce Produit',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          GestureDetector(
                                            onTap:(){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Produit(produit: widget.produit!)));

                                            },
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:ThemeStyle.teal,
                                                borderRadius: BorderRadius.circular(10),


                                              ),
                                              child:const Center(child: Text('Modifier ce Produit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          GestureDetector(
                                            onTap:(){},
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:ThemeStyle.muted,
                                                borderRadius: BorderRadius.circular(10),

                                              ),
                                              child:const Center(child: Text('Fermer le Diag',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
                                            ),
                                          ),

                                        ],

                                      ),
                                    );
                                  },
                                );
                                //Delete_Client();
                              },


                              icon: Icon(Icons.more_vert,size: 20,color: Colors.teal,))
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

                  TextButton(onPressed: ()=> {}, child:  Text("Detail",style: GoogleFonts.lato(color:Colors.teal,fontSize: 13,fontWeight: FontWeight.bold ),))

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}
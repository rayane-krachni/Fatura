import 'package:flutter/material.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Querries/BonLivraison_Session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Detals_pdf/bills_Detail.dart';

class BillsItem extends StatefulWidget {
  BonLivraison_Model? bills ;
  BillsItem({Key? key,this.bills}) : super(key: key);

  @override
  _BillsItemState createState() => _BillsItemState();
}

class _BillsItemState extends State<BillsItem> {
  void Delete_Bills()async {

    int insrtcleint=   await BonLivraisonSession.DeleteBills(widget.bills!.id!);
    if( insrtcleint!= 0)
    {
      showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }

  @override
  Widget build(BuildContext context) {
    double _height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BillsDetal(bill:widget.bills! ,),)
        );

      },
      child: Padding(
        padding: const EdgeInsets.all( 5.0),
        child: Container(

          height: _height*0.1,
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
                                      height: 200,
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
                                              Delete_Bills();
                                            },
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),


                                              ),
                                              child: Center(child: Text('Supprimer Le bon de livraison',style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                                            ),
                                          ),

                                          SizedBox(height: 5,),
                                          GestureDetector(

                                            onTap: () => Navigator.pop(context),
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:ThemeStyle.muted,
                                                borderRadius: BorderRadius.circular(10),

                                              ),
                                              child: Center(child: Text('Fermer le Diag',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
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
                        backgroundImage: AssetImage("assets/images/delivery.png",),
                        radius: 25,
                      ),
                      SizedBox(height: 5,),
                      Text(widget.bills!.chauffeur!,style: GoogleFonts.lato(color:Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),

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
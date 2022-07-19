import 'package:flutter/material.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Querries/BonLivraison_Session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Padding(
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
                        IconButton(onPressed: (){
                         Delete_Bills();
                        }, icon: Icon(Icons.more_vert,size: 30,color: Colors.teal,))
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/delivery.png",),
                      radius: 30,
                    ),
                    SizedBox(height: 15,),
                    Text(widget.bills!.id_facture!.toString(),style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

                  ],
                ),

                FlatButton(onPressed: ()=> {}, child:  Text("Detail",style: GoogleFonts.lato(color:Colors.teal,fontSize: 13,fontWeight: FontWeight.bold ),))

              ],
            ),
          ),
        ),

      ),
    );
  }
}

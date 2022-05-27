
import 'package:flutter/material.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Screens/Details/Facture_Detail/Detail_Facture.dart';
import 'package:freelance/widget/PdfApi.dart';
import 'package:freelance/widget/PdfEnvoiceApi.dart';
import 'package:google_fonts/google_fonts.dart';

class FactureItem extends StatefulWidget {
  Facture_Model? facture;
  FactureItem({Key? key,this.facture}) : super(key: key);

  @override
  _FactureItemState createState() => _FactureItemState();
}

class _FactureItemState extends State<FactureItem> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ()async{
        final pdfFile= await PdfEnvoiceApi.generate(widget.facture!);

        PdfApi.openFile(pdfFile);
       // Navigator.push(context, MaterialPageRoute(builder: (context) => FactureDetailExported(facture: widget.facture! )))

      },
      child: Container(
        margin: const EdgeInsets.all(5.0) ,
        height: _height*0.04,
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(
                blurRadius:5 ,
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(0,3)
            )]
        ),
        child: Padding(
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
                      backgroundImage: AssetImage("assets/images/facture.png",),
                      radius: 30,
                    ),
                    SizedBox(height: 10,),
                    Text(widget.facture!.num_facture.toString(),style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

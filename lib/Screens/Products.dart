import 'package:flutter/material.dart';
import 'package:freelance/Screens/Creation/Produit.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Session des Produits  !",style: ThemeStyle.initialtitle,)),
              IconButton(icon:Icon(Icons.add_circle_outlined,size: 33,color: Colors.teal,),
                onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddProduit() )); },)
            ],
          ),
          const SizedBox(height: 5,),
          Text("Dans cette vous pouvez consulter , modifier et suprimer votre produits.",style:ThemeStyle.secondtitle,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Container(

              height: _height*0.06,
              width: double.infinity,
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(
                      blurRadius:5 ,
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0,3)
                  )]
              ),
              child: TextFormField(
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Recherche',
                  helperStyle: GoogleFonts.lato(color:ThemeStyle.muted,fontSize: 9 ),
                  prefixIcon: Icon(Icons.search_rounded),

                ),

              ),
            ),
          ),
          Expanded(

            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder:(BuildContext context,int index){
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
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage("assets/images/box.png",),
                                  radius: 30,
                                ),
                                SizedBox(height: 15,),
                                Text("Produit Nom",style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                                SizedBox(height: 5,),
                                Text("2000da/kg",style: GoogleFonts.lato(color:Colors.black54,fontSize: 13,fontWeight: FontWeight.bold ),),
                              ],
                            ),

                            FlatButton(onPressed: ()=> {}, child:  Text("Detail",style: GoogleFonts.lato(color:Colors.teal,fontSize: 13,fontWeight: FontWeight.bold ),))

                          ],
                        ),
                      ),
                    ),

                  ),
                );
              },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freelance/Theme/Theme.dart';

class AddProduit extends StatefulWidget {
  const AddProduit({Key? key}) : super(key: key);

  @override
  State<AddProduit> createState() => _ProduitState();
}

class _ProduitState extends State<AddProduit> {
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeStyle.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: ThemeStyle.scaffoldBgColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.teal),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Ajouter un  Produit",style: ThemeStyle.addtitles,)),
              const SizedBox(height: 5,),
              Align(

                  alignment: Alignment.topLeft,
                  child: Text("Svp Remplir tous les champs necessaire",style: ThemeStyle.secondtitle,)),
              const SizedBox(height: 10,),
              Form(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.062,
                            width: double.infinity,
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom: 6),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Designation du Produit",
                                  suffixIcon:  Icon(Icons.production_quantity_limits,size: 18,),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.062,
                            width: double.infinity,
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom: 6),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Prix",
                                  suffixIcon:  Icon(Icons.price_check_outlined,size: 18,),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.062,
                            width: double.infinity,
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Code",
                                  suffixIcon:  Icon(Icons.code,size: 18,),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(

                            height: _height*0.062,
                            width: double.infinity,
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
                              padding: const EdgeInsets.only(top:1.0,left: 15,right: 5,bottom:12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Tva",
                                    suffixIcon: Icon(Icons.percent,size: 18,)
                                ),
                              ),
                            )),
                      ),



                    ],
                  )),
              SizedBox(height: 20,),
              SizedBox(
                width: _width,
                height: _height*0.06,
                child: RaisedButton(
                  onPressed: () {  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),

                  ),
                  color: Colors.teal,
                  child: Text("Ajouter",style: ThemeStyle.buttontext,),

                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

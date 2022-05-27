import 'package:flutter/material.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Screens/Products.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:freelance/widgets/Wrong_Diag.dart';

class AddProduit extends StatefulWidget {
  const AddProduit({Key? key}) : super(key: key);

  @override
  State<AddProduit> createState() => _ProduitState();
}

class _ProduitState extends State<AddProduit> {
  TextEditingController ? name_control,tva_control,prix_control,code_control,stock_control;

  @override
  void initState() {
    // TODO: implement initState
    name_control= new TextEditingController();
    prix_control=new TextEditingController();
    code_control= new TextEditingController();
    tva_control= new TextEditingController();
    stock_control= new TextEditingController();

  }
  String get name => name_control!.text;
  int get tva => int.parse(tva_control!.text);
  double get prix => double.parse(prix_control!.text);
  String get code => code_control!.text;
  int get stock => int.parse(stock_control!.text);



  void Insert_Produit()async {

    int insrtproduit= await ProduitSession.Addproduit(name, tva, prix, code, stock);
    if( insrtproduit!= 0)
    {
      print('succes');
      //  showDialog(context: context, builder:(_)=> Wrong_Dialog());

      showDialog(context: context, builder:(_)=> Success_Dialog(mytext: "Le nouveau Founisseur a ete bien ajoutee",mywidgets:()=> HomePage(),));
    }
    else {
      print('results $insrtproduit');
      showDialog(context: context, builder:(_)=> Wrong_Dialog());

    }

  }
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
                                controller: name_control,
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
                                controller: prix_control,
                                keyboardType: TextInputType.phone,
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
                                controller: code_control,
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
                                controller: tva_control,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Tva",
                                    suffixIcon: Icon(Icons.percent,size: 18,)
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
                                controller: stock_control,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "stock",
                                    suffixIcon: Icon(Icons.percent,size: 18,)
                                ),
                              ),
                            )),
                      ),



                    ],
                  )),
              SizedBox(height: 20,),
              Container(
                width: _width,
                height: _height*0.063,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),


                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.teal,
                      Colors.tealAccent,
                    ],
                  ),  ),

                child: ElevatedButton(
                    onPressed: () {
                      Insert_Produit();
                    },

                    style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                    child: Center(child: Text("Ajouter",style: ThemeStyle.buttontext,))
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

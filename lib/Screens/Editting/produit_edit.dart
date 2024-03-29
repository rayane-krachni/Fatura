import 'package:flutter/material.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/Screens/HomePage.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:freelance/widgets/Success_Diag.dart';
import 'package:freelance/widgets/Wrong_Diag.dart';

class Edit_Produit extends StatefulWidget {
  Produit_Model? produit;
  Edit_Produit({Key? key,required this.produit}) : super(key: key);

  @override
  State<Edit_Produit> createState() => _Edit_ProduitState();
}

class _Edit_ProduitState extends State<Edit_Produit> {
  TextEditingController ? name_control,tva_control,prix_control,code_control,stock_control;

  @override
  void initState() {
    // TODO: implement initState
    name_control=  TextEditingController(text: widget.produit!.name);
    prix_control= TextEditingController(text:widget.produit!.prix.toString());
    code_control=  TextEditingController(text: widget.produit!.code);
    tva_control=  TextEditingController(text: widget.produit!.tva.toString());
    stock_control=  TextEditingController(text: widget.produit!.stock.toString());

  }
  String get name => name_control!.text;
  int get tva => int.parse(tva_control!.text);
  double get prix => double.parse(prix_control!.text);
  String get code => code_control!.text;
  int get stock => int.parse(stock_control!.text);



  void Update_Produit()async {

    int insrtproduit= await ProduitSession.Edit_Produit(widget.produit!.id!,name, tva, prix, code, stock);
    if( insrtproduit!= 0)
    {
      showDialog(context: context, builder:(_)=> Success_Dialog(mytext: "les informations sont bien sauvegardés",mywidgets:()=> HomePage(),));
    }
    else {

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
                  child: Text("Modifier Les Informations",style: ThemeStyle.addtitles,)),
              const SizedBox(height: 5,),
              Align(

                  alignment: Alignment.topLeft,
                  child: Text("Svp Remplir tous les champs necessaires",style: ThemeStyle.secondtitle,)),
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
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
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
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
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
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
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
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
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
                                decoration:const InputDecoration(
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
                                borderRadius:const BorderRadius.all(Radius.circular(15)),
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
                                decoration:const InputDecoration(
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
                      if(
                      name.isEmpty||
                          prix==''||
                          code.isEmpty||
                          tva==''||
                          stock==''
                      )
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Remplir Les Chanps ')));

                      }
                      else{Update_Produit();}

                    },

                    style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                    child: Center(child: Text("Enregistrer",style: ThemeStyle.buttontext,))
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
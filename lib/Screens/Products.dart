import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Items/produit_item.dart';
import 'package:freelance/Model/Produit/Produit_Model.dart';
import 'package:freelance/Providers/Produits_Management.dart';
import 'package:freelance/Querries/Produit_Session.dart';
import 'package:freelance/Screens/Creation/Produit.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Produit_Manage ProduitManager= Produit_Manage();
  List<Produit_Model>? products;
  List<Produit_Model>? FiltreProduit;
  TextEditingController? searchkey = TextEditingController();
  void getProduits() async{
    List<Produit_Model> map=await ProduitSession.GetAllProducts();
    products=map;
    ProduitManager.produits=true;
    print('produits $products');
  }

  @override
  void initState() {
    // TODO: implement initState
    getProduits();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: ProduitManager,
      child: Consumer<Produit_Manage>(
        builder: (context,produitmanager,_)
        {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 15,right: 15,bottom: 0),
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
                        controller: searchkey,
                        onChanged: (value){
                          value=value.toLowerCase();
                          setState(() {
                            FiltreProduit=products!.where((c) {

                              var searchclient=c.name!.toLowerCase();
                              return searchclient.contains(value);

                            } ).toList();
                          });
                        },
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
                    child :  !produitmanager.produits ?
                    const Center(
                      child: SpinKitPouringHourGlassRefined  (
                        color: Colors.teal,
                        size: 50.0,
                        duration: Duration(milliseconds: 12000),

                      ),
                    )
                        : products?.isNotEmpty ?? true ?
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount:searchkey!.text.isNotEmpty ? FiltreProduit!.length:products!.length,
                      itemBuilder:(BuildContext context,int i){
                        return ProduitsItem(produit:searchkey!.text.isNotEmpty ? FiltreProduit![i]: products![i],);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ):Center(
                      //
                        child: FlatButton(child: const Center(child: Text('Y a pas des Produits Existees \n Clicker ici pour les ajouter ')),onPressed: ()=>
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddProduit(),)
                            )))
                )



                ],
              ),

          );
        },

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Items/bills_item.dart';
import 'package:freelance/Model/BonLivraisson_Model.dart';
import 'package:freelance/Providers/BonLivraisson_Management.dart';
import 'package:freelance/Querries/BonLivraison_Session.dart';
import 'package:freelance/Screens/Creation/Bon_Livraisson.dart';
import 'package:freelance/Screens/Creation/Produit.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class Consulte_Bon extends StatefulWidget {
  const Consulte_Bon({Key? key}) : super(key: key);

  @override
  State<Consulte_Bon> createState() => _Consulte_BonState();
}

class _Consulte_BonState extends State<Consulte_Bon> {
  Bills_Manage manager= Bills_Manage();
  List<BonLivraison_Model>? bills;
  List<BonLivraison_Model>? filtrebill;
  TextEditingController? searchkey = TextEditingController();
  void getBills() async {
    List<BonLivraison_Model> res= await BonLivraisonSession.getbills();
    bills=res;
    //List<Client_Model> mmap = await (response as List).map((c) => Client_Model.fromMap(c)).toList();
   manager.loadingbills=true;

  }
  @override
  void initState() {
    // TODO: implement initState
    getBills();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider.value(
        value: manager,
        child: Consumer<Bills_Manage>(
          builder: (buildContext,billsmanager,_){
            return Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20,bottom: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Session des Bons de Livraison   !",style: ThemeStyle.initialtitle,)),
                  const SizedBox(height: 5,),
                  Text("Dans cette vous pouvez consulter , modifier et suprimer votre Bons de Livraison .",style:ThemeStyle.secondtitle,),
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
                            filtrebill=bills!.where((c) {

                          var searchclient=c.chauffeur!.toLowerCase();
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
                      child: !billsmanager.loadingbills
                      ?     const Center(
                        child: SpinKitPouringHourGlassRefined  (
                          color: Colors.teal,
                          size: 50.0,
                          duration: Duration(milliseconds: 12000),

                        ),
                      )  :
                            bills?.isEmpty ?? true ? Center(
                        //
                             child: FlatButton(child:const Center(child: Text('Y a pas des  Bon de livraison Existees \n     Clicker ici pour les ajoutees ')),onPressed: ()=>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddLivraison(),)
                              ))):
                      GridView.builder(
                      shrinkWrap: true,
                      itemCount: searchkey!.text.isNotEmpty ? filtrebill!.length: bills?.length,
                      itemBuilder:(BuildContext context,int i){
                        return BillsItem(bills:  searchkey!.text.isNotEmpty ? filtrebill![i]: bills![i],);
                      },
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  )
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}

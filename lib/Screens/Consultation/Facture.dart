import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Items/facture_item.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Facture_Session.dart';
import 'package:freelance/Screens/Creation/Facture.dart';
import 'package:freelance/Screens/Creation/Produit.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Consulte_Facture extends StatefulWidget {
  const Consulte_Facture({Key? key}) : super(key: key);

  @override
  State<Consulte_Facture> createState() => _Consulte_FactureState();
}

class _Consulte_FactureState extends State<Consulte_Facture> {
  Facture_Manage manager= Facture_Manage();
  TextEditingController? searchkey = TextEditingController();

  List<Facture_Model>? factures;
  List<Facture_Model>? filtrefactures;

  void getFactures() async {
    List<Facture_Model> res= await FactureSession.getAllData();
    factures=res;
    //List<Client_Model> mmap = await (response as List).map((c) => Client_Model.fromMap(c)).toList();
    manager.loadingfacture=true;

  }
  @override
  void initState() {
    // TODO: implement initState
    getFactures();
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.teal)
      ),
      body: ChangeNotifierProvider.value(
        value: manager,
        child: Consumer<Facture_Manage>(

          builder: (BuildContext context, facturemanager, _) {
            return Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20,bottom: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Session des Factures  !",style: ThemeStyle.initialtitle,)),
                  const SizedBox(height: 5,),
                  Text("Dans cette vous pouvez consulter , modifier et suprimer votre Factures.",style:ThemeStyle.secondtitle,),
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
                            filtrefactures=factures!.where((c) {

                              var searchclient=c.date!.toLowerCase();
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

                    child: !facturemanager.loadingfacture
                        ?     const Center(
                      child: SpinKitPouringHourGlassRefined  (
                        color: Colors.teal,
                        size: 50.0,
                        duration: Duration(milliseconds: 12000),

                      ),
                    ) : factures?.isEmpty ?? true ?  Center(
                      //
                        child: FlatButton(child: Center(child: Text('Clicker ici pour jouter une facture ')),onPressed: ()=>
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddFacture(),)
                            ))):

                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: factures!.length,
                      itemBuilder:(BuildContext context,int i){
                        return FactureItem(facture: factures![i],);
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
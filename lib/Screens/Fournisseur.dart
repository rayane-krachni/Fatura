import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freelance/Items/fournisseur_item.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Providers/Fournisseur_Management.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';

import 'package:freelance/Screens/Creation/Fournisseur.dart';
import 'package:freelance/Theme/Theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Fournisseur extends StatefulWidget {
  const Fournisseur({Key? key}) : super(key: key);

  @override
  State<Fournisseur> createState() => _FournisseurState();
}

class _FournisseurState extends State<Fournisseur> {
  Fournisseur_Manage fournisseur_manager= Fournisseur_Manage();
  List<Fournisseur_Model>? fournisseurs;
  List<Fournisseur_Model>? FilterFournisseur;
  TextEditingController? searchkey = TextEditingController();
  void getFournisseur() async{
    List<Fournisseur_Model> map = await FournisseurSession.getAll();
    fournisseurs=map;
    fournisseur_manager.fournisseur=true;

  }

  @override
  void initState() {
    // TODO: implement initState
    getFournisseur();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: fournisseur_manager,
      child: Consumer<Fournisseur_Manage>(
        builder: (context,fournisseurmanager,_){
          return Padding(
            padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20,bottom: 20),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Session des Fournisseurs !",style:ThemeStyle.initialtitle,)),
                    IconButton(
                      icon:Icon(Icons.add_circle_outlined,size: 33,color: Colors.teal,),
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddFournisseurs() )); },)
                  ],
                ),
                const SizedBox(height: 5,),
                Text("Dans cette vous pouvez consulter , modifier et suprimer votre fournisseurs",style: ThemeStyle.secondtitle,),
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
                          FilterFournisseur=fournisseurs!.where((c) {

                            var searchclient=c.fullname!.toLowerCase();
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

                  child: !fournisseur_manager.fournisseur ?
                  const Center(
                    child: SpinKitPouringHourGlassRefined  (
                      color: Colors.teal,
                      size: 50.0,
                      duration: Duration(milliseconds: 12000),

                    ),
                  ) : fournisseurs?.isEmpty ?? true ?  Center(
                    //
                      child: TextButton(child: Center(child: Text('Clicker ici pour  ajouter un fournisseur ')),onPressed: ()=>
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddFournisseurs(),)
                          )))

                      : ListView.builder(

                    itemCount:searchkey!.text.isNotEmpty ? FilterFournisseur!.length: fournisseurs!.length,
                    itemBuilder:(BuildContext context,int index){
                      return FournisseurItem(fournisseur:searchkey!.text.isNotEmpty ? FilterFournisseur![index]: fournisseurs?[index],);
                    } ,
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freelance/Model/Client/Client_Facture.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';
import 'package:freelance/Providers/Facture_Management.dart';
import 'package:freelance/Querries/Client_session.dart';
import 'package:freelance/Querries/Fournisseur_Session.dart';
import 'package:freelance/Screens/Details/Facture_Detail/header_envoice.dart';
import 'package:provider/provider.dart';

class FactureDetailExported extends StatefulWidget {
  Facture_Model? facture;
  FactureDetailExported({Key? key,this.facture}) : super(key: key);

  @override
  _FactureDetailExportedState createState() => _FactureDetailExportedState();
}



class _FactureDetailExportedState extends State<FactureDetailExported> {
  Facture_Manage managerdata =Facture_Manage();
  List<Client_Model> ? clientlist;
  List<Fournisseur_Model> ? fournisseurlist;
  void getlistclient() async
  {
    List<Client_Model> myclientlist= await ClientSession.getClientbyid(widget.facture!.id_client!);
    print('mmm $myclientlist');
    clientlist=myclientlist;
    managerdata.loadingclient=true;
    print('ggg ${clientlist![0]}');
  }

  void getlistfournisseur() async
  {
    List<Fournisseur_Model> myfournisseurlist= await FournisseurSession.getfournisseurbyid(widget.facture!.id_fournisseur!);
    print('mmm $myfournisseurlist');
    fournisseurlist=myfournisseurlist;
    managerdata.loadingfournisseur=true;
    print('ggg ${fournisseurlist![0]}');
  }

  @override
  void initState() {
    getlistclient();
    getlistfournisseur();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: managerdata,
      child: Consumer<Facture_Manage>(
        builder: (buildcontext,facturemanager,_){
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  BuildHeader.Header(widget.facture!)
                ],
              ),),
          );
        },

      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:freelance/Model/Client/Client_Model.dart';
import 'package:freelance/Model/Fcature/Facture_Model.dart';
import 'package:freelance/Model/Fournisseur/Fournisseur_Model.dart';

class BuildHeader {

  static Widget Header(Facture_Model invoice){

    return Container(

      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Facture Num ${invoice.num_facture}"),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
               /* Container(
                  child: Column(
                    children: [
                      Text("Client : ${fournisseur.fullname}"),
                      Text("Address : ${fournisseur.address}"),
                      Text("Tel/Fax : ${fournisseur.telephone}"),
                      Text("Entreprise : ${fournisseur.company}"),
                      Text("Activite : ${fournisseur.activite}"),
                      Text("No Nif : ${fournisseur.nif}"),
                      Text("No Nic : ${fournisseur.nic}"),
                      Text("No Art : ${fournisseur.art}"),
                      Text("No rc : ${fournisseur.rc}"),

                    ],
                  ),
                ),*/
            /* Container(
                  child: Column(
                    children: [
                      Text("Client : ${client.fullname}"),
                      Text("Address : ${client.address}"),
                      Text("Tel/Fax : ${client.telephone}"),
                      Text("Activite : ${client.activite}"),
                      Text("No Nif : ${client.nif}"),
                      Text("No Nic : ${client.nic}"),
                      Text("No Art : ${client.art}"),
                      Text("No rc : ${client.rc}"),
                    ],
                  ),
                )*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
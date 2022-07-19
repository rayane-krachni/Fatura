
import 'package:flutter/material.dart';

class Facture_Model extends ChangeNotifier{
  final int? id;
  final int? id_fournisseur;
  final int? id_client;
  final String? num_facture;
  final String? date;
  final String? id_produit;
  final String? quantite;
  final String? remise;
  final String? unite;
  final int? timber;


  Facture_Model({this.id,this.id_fournisseur,this.id_client,this.num_facture,this.date,this.id_produit,this.quantite,this.remise,this.unite,this.timber});

  factory Facture_Model.fromMap(Map<String, dynamic> json) => Facture_Model(
    id: json['id'],
    id_fournisseur: json['id_fournisseur'],
    id_client: json['id_client'],
    num_facture: json['num_facture'],
    date: json['date'],
    id_produit: json['id_produit'],
    quantite: json['quantite'],
    remise: json['remise'],
    unite:json['unite'],
    timber:json['timber'],
  );

  Map< String, dynamic> toMap(){
    return{
      'id':id,
      'id_fournisseur': id_fournisseur,
      'id_client':id_client,
      'num_facture':num_facture,
      'date':date,
      'id_produit': id_produit,
      'quantite':quantite,
      'remise':remise,
      'unite':unite,
      'timber':timber,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'envoice{id:$id,id_fournisseur:$id_fournisseur,id_client:$id_client,num_facture:$num_facture,date:$date,id_produit:$id_produit,quantite:$quantite,remise:$remise,unite:$unite,timber:$timber}';
  }
}
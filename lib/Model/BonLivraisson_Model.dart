
import 'package:flutter/material.dart';

class BonLivraison_Model extends ChangeNotifier{
  final int? id;
  final int? id_fournisseur;
  final int? id_client;
  final int? id_facture;
  final String? date;
  final String? transport;
  final String? matricule;
  final String? chauffeur;
  final String? mode_pay;



  BonLivraison_Model({this.id,this.id_fournisseur,this.id_client,this.id_facture,this.date,this.transport,this.matricule,this.chauffeur,this.mode_pay});

  factory BonLivraison_Model.fromMap(Map<String, dynamic> json) => BonLivraison_Model(
    id: json['id'],
    id_fournisseur: json['id_fournisseur'],
    id_client: json['id_client'],
    id_facture: json['id_facture'],
    date: json['date'],
    transport: json['transport'],
    matricule: json['matricule'],
    chauffeur: json['chauffeur'],
    mode_pay: json['mode_pay'],
  );

  Map< String, dynamic> toMap(){
    return{
      'id':id,
      'id_fournisseur': id_fournisseur,
      'id_client':id_client,
      'id_facture':id_facture,
      'date': date,
      'transport':transport,
      'matricule':matricule,
      'chauffeur':chauffeur,
      'mode_pay':mode_pay,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'bon_livraison{id:$id,id_fournisseur:$id_fournisseur,id_client:$id_client,id_facture:$id_facture,date:$date,transport:$transport,matricule:$matricule,chauffeur:$chauffeur,mode_pay:$mode_pay}';
  }
}
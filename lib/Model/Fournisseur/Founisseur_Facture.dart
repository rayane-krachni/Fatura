

import 'package:flutter/material.dart';

class FournisseurFcture_Model extends ChangeNotifier{
  final int? id;
  final String? fullname;

  FournisseurFcture_Model({this.id, this.fullname });

  factory FournisseurFcture_Model.fromMap(Map<String, dynamic> json) => FournisseurFcture_Model(
    id: json['id'],
    fullname: json['fullname'],);

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'fullname':fullname,


    };

  }
  @override
  String toString(){
    return 'fournisseur{id: $id,fullname:$fullname}';
  }


}
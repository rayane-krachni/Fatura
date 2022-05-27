

import 'package:flutter/material.dart';

class ClientFcture_Model extends ChangeNotifier{
  final int? id;
  final String? fullname;

  ClientFcture_Model({this.id, this.fullname });

  factory ClientFcture_Model.fromMap(Map<String, dynamic> json) => ClientFcture_Model(
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
    return 'client{id: $id,fullname:$fullname}';
  }


}
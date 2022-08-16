import 'package:flutter/material.dart';
import 'package:freelance/Theme/Theme.dart';

class Ritch_Text extends StatelessWidget {
  String title;
  String detail;
  IconData icon;
  Color iconcolor;
  double fontsize;
  double fontsize2;

  Ritch_Text({Key? key,required this.title,required this.detail, required this.icon,this.iconcolor=Colors.teal,this.fontsize=13,this.fontsize2=13}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 16,color: iconcolor,),
          const SizedBox(width: 7,),
          Text(title ,style: TextStyle(fontSize: fontsize,fontWeight: FontWeight.bold),),
          const SizedBox(width: 10,),
          Text(detail,overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines:3,
            style: TextStyle(fontSize: fontsize2,fontWeight: FontWeight.w400),     softWrap: true,
          ),
        ],
      ),
    );
  }

}
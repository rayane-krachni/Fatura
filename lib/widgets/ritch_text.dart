import 'package:flutter/material.dart';

class Ritch_Text extends StatelessWidget {
  String title;
  String detail;
  IconData icon;

  Ritch_Text({Key? key,required this.title,required this.detail, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,size: 16,),
          const SizedBox(width: 7,),
          Text(title ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
          const SizedBox(width: 10,),
          Text(detail,overflow: TextOverflow.ellipsis,
                maxLines:3,
                style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),     softWrap: true,
            ),
        ],
      ),
    );
  }

}

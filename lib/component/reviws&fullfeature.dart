import 'package:flutter/material.dart';

class Featurecontainer extends StatelessWidget {
 Featurecontainer({super.key,this.description});
final String ?description;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Center(child: Text('Full Specification',style: TextStyle(color: Colors.black),)),
                height: 48,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),Container(
                child: Center(child: Text('Reviews',style: TextStyle(fontWeight: FontWeight.bold),)),
                height: 48,
                width: 110,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),

            ],
          ),
          height: 50,
          width: 250,
          decoration:const  BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),const SizedBox( height: 30,),
        SizedBox(width: 320,
          child: Text('$description'),
        )

      ],
    );
  }
}

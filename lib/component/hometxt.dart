import 'package:flutter/material.dart';

class Hometxt extends StatelessWidget {
  const Hometxt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
 children: [
   Padding(
     padding: EdgeInsets.all(15),
     child: Text(
       'Discover our exclusive product',
       style: TextStyle(
           color: Colors.black,
           fontSize: 30,
           fontWeight: FontWeight.bold),
     ),
   ),
   Padding(
     padding: EdgeInsets.all(15),
     child: Text(
       'in this marketplace, you will find various technics in the cheapest price',
       style: TextStyle(
           color: Colors.grey,
           fontSize: 18,
           fontWeight: FontWeight.bold),
     ),
   )
 ],    );
  }
}

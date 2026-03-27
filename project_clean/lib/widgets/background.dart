import 'package:flutter/material.dart';
class Background extends StatelessWidget{
 const Background({super.key});
@override
Widget build(context){
  return  Stack(
   children: [
       
   
        Image.asset('assets/images/background curve.png',
        //fit: BoxFit.cover,
        
   ),
   ],
  );
}
}
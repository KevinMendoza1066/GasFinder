import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Precios extends StatelessWidget{
String tipoGasolina="";
String valor="";

Precios({ required this.tipoGasolina,required this.valor});

Widget build(BuildContext context){
 return  Column(
        children: <Widget>[
          Text("$tipoGasolina",style: TextStyle(color: Color(0xffeebd3d),fontSize: 20),),
          Text("$valor",style: TextStyle(color: Color(0xfff5e0b1),fontSize: 40),),
        ],
 );
}

}
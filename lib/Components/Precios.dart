import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Precios extends StatelessWidget{
String zona="";
String tipoGasolina="";
String valor="";

Precios({required this.zona, required this.tipoGasolina,required this.valor});

Widget build(BuildContext context){
 return Scaffold(
    body: Column(
        children: <Widget>[
          Text("Zona:$zona"),
          Text("Gasolina:$tipoGasolina"),
          Text("Precio:$valor"),
        ],
    ),
 );
}

}
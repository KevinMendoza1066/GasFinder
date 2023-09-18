import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_finder/PrecioActual.dart';
import 'package:gas_finder/VerGasolinera.dart';
import '../AcercaDe.dart';
import '../MiPerfil.dart';
import '../Start.dart';
import '../CercaDeMi.dart';
import 'package:flutter/cupertino.dart';

class ButtonMenu extends StatelessWidget{

  String nameButton="";
  final Widget navigateTo;
  IconData buttonIcon=Icons.home;
  bool isPrincipal = false;
  ButtonMenu(nameButton,this.navigateTo,buttonIcon,isPrincipal){
    this.nameButton = nameButton;
    this.buttonIcon = buttonIcon;
    this.isPrincipal = isPrincipal;
  }
  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: () {
        // Acción a ejecutar cuando se presione el botón
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => navigateTo

          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: isPrincipal?  MaterialStateProperty.all(Color(0xffd22833)): null,
        padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            buttonIcon, // Icono relacionado (por ejemplo, un ícono de inicio)
            color: isPrincipal? Colors.white:Colors.black,
          ),
          SizedBox(width: 8.0), // Espacio entre el icono y el texto
          Text(
            this.nameButton,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: isPrincipal? Colors.white:Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget{
  String principalScreen = "Inicio";
  List MenuItems =["Inicio","CercadeMi","VerGasolineras","PrecioActual","MiPerfil","AcercaDe"];
  MenuList(principalScreen){
    this.principalScreen=principalScreen;
  }
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonMenu("Inicio",Start(),Icons.home,principalScreen==MenuItems[0]),
        SizedBox(height: 20,),
        ButtonMenu("Cerca de Mi ",CercadeMi(),Icons.location_pin,principalScreen==MenuItems[1]),
        SizedBox(height: 20,),
        ButtonMenu("Ver Gasolineras ",VerGasolinera(),Icons.search,principalScreen==MenuItems[2]),
        SizedBox(height: 20,),
        ButtonMenu("Precio Actual ",PrecioActual(),Icons.price_change,principalScreen==MenuItems[3]),
        SizedBox(height: 20,),
        ButtonMenu("Mi Perfil ",MiPerfil(),Icons.person,principalScreen==MenuItems[4]),
        SizedBox(height: 20,),
        ButtonMenu("Acerca De",AcercaDeScreen(),Icons.info,principalScreen==MenuItems[5]),
      ],
    );
  }
}


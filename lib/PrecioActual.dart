import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Components/MenuList.dart';
import 'Components/PreciosTabBar.dart';

class PrecioActual extends StatelessWidget {
  const PrecioActual({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: Scaffold(

        body: DrawerMenu(),//DrawerMenu(),

      ),
    );
  }
}
/*Drawer*/
class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}
class _DrawerMenuState extends State<DrawerMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:Center(
        child: Stack(
          children: [
            PreciosTabBar(),
            Positioned(
              top: 50,
              left: 250,
              right: 0,
              child: MenuBar(_scaffoldKey),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el cajón lateral
                  },
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 80,),
            Align(
              alignment: Alignment.bottomCenter,
              child: MenuList("PrecioActual"),
            )
          ],
        ),
      ),
    );
  }
}
class MenuBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  MenuBar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Color de la sombra
                spreadRadius: 0.5, // Extensión de la sombra
                blurRadius: 6, // Desenfoque de la sombra
                offset: Offset(0, 4), // Desplazamiento de la sombra
              ),
            ],// Borde redondeado
          ),
          constraints: BoxConstraints(
            maxHeight: 65, // Altura máxima del Container
            minHeight: 65, // Altura mínima del Container
            maxWidth: 65,

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: Icon(Icons.menu, color: Colors.black),
              ),
            ],
          ),
        )
    );
  }
}
/*End Drawer*/

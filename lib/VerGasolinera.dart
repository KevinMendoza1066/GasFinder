import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/MenuList.dart';
import 'Start.dart';
class VerGasolinera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: Scaffold(
        body: DrawerMenu(),
      ),
    );
  }
}

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFAFAFA),
      key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
          Positioned.fill(
          // This is your Map
          child: Container(
          color: Colors.white,
            child: const Center(
              child: Text('Encuentra la Gasolinera Mas Cercana....'),
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
    child: TextField(
    decoration: const InputDecoration(
    hintText: 'Buscar Gasolinera',
    fillColor: Colors.white,
    filled: true
    ),
    ),
        )
            ],
          ),
        ),
    );
  }
}





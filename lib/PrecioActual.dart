import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(
          backgroundColor: Color(0xff536dfe),
          title: Text('Precio Actual'),
        ),
        backgroundColor: Color(0xffe3f2fd),
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
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Table(
            border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding:EdgeInsets.all(8.0),
                      child: Text('Gasolina zona Central'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Text('Precio'),
                    ),
                  ),
                ]
              ),
              const TableRow(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('Regular'),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('4.50'),
                      ),
                    ),
                  ]
              ),
              const TableRow(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('Especial'),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('4.80'),
                      ),
                    ),
                  ]
              ),
              const TableRow(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('Disel'),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding:EdgeInsets.all(8.0),
                        child: Text('3.80'),
                      ),
                    ),
                  ]
              ),

            ]
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Components/MenuList.dart';
import 'package:animate_do/animate_do.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: Scaffold(
        body: FadeInDown(child:DrawerMenu()),
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
      backgroundColor: Color(0xffFFFFFF),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MenuBar(_scaffoldKey),
          const SizedBox(height: 12,),
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),

            ),
            constraints:const BoxConstraints(
              maxHeight: 200, // Altura máxima del Container
              minHeight: 200, // Altura mínima del Container
              maxWidth: 300,
            ),
          child: Image.asset("assets/Banner.png",),
          ),
          const SizedBox(height: 32,),
          Text("Gasolineras mejor calificadas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff77849a)),),
          const SizedBox(height: 12,),
          ListGasStation()
        ],
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
              child: MenuList("Inicio"),
            )
          ],
        ),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  String userName = "John Doe"; // Nombre de ejemplo

  MenuBar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
            maxHeight: 70, // Altura máxima del Container
            minHeight: 70, // Altura mínima del Container
            maxWidth: 320,

          ),

          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido',
                        style: TextStyle(fontSize: 18, ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xffd22833)),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
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
class ListGasStation extends StatefulWidget{

  @override
  _ListGasStationState createState() => _ListGasStationState();
}
class _ListGasStationState extends State<ListGasStation> {
  List<GasStation> _GasStationList = [
    GasStation("Test", "TEST", 4.0, 1,"https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",false),
    GasStation("Tes2", "TEST2", 3.0, 1,"https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",true),
    GasStation("Tes3", "TEST3", 3.0, 1,"https://easygasgroup.com/wp-content/uploads/2020/02/A_opt.jpg",true),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300, // Establece la altura que desees
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(

            itemCount: _GasStationList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Color de fondo del ListTile
                    borderRadius: BorderRadius.circular(8), // Borde redondeado opcional
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Color de la sombra
                        spreadRadius: 1, // Extensión de la sombra
                        blurRadius: 5, // Desenfoque de la sombra
                        offset: Offset(0, 3), // Desplazamiento de la sombra (vertical, horizontal)
                      ),
                    ],
                  ),
                  child:ListTile(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    title: Text(_GasStationList[index].name),
                    subtitle: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_GasStationList[index].direction),
                          SizedBox(height: 5,),
                          RatingBar.builder(
                            initialRating:  _GasStationList[index].rating.toDouble(), // Puntuación inicial (puedes cambiarlo según tus necesidades)
                            minRating: 1, // Valor mínimo permitido
                            direction: Axis.horizontal, // Dirección de las estrellas (horizontal o vertical)
                            allowHalfRating: true, // Permitir calificaciones medias (0.5, 1.5, 2.5, etc.)
                            itemCount: 5, // Número total de estrellas
                            itemSize: 25, // Tamaño de cada estrella
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber, // Color de las estrellas llenas
                            ),
                            onRatingUpdate: (rating) {
                              // Acción cuando el usuario intenta cambiar la calificación
                            },
                            ignoreGestures: true, // Hace que el widget sea no editable
                          )

                        ],
                      ) ,
                    ),
                    leading: Image.network(_GasStationList[index].url.toString()),
                    trailing: IconButton(
                        icon: Icon(
                          _GasStationList[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _GasStationList[index].isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            // Cambia el estado de favorito al presionar el ícono
                            _GasStationList[index].isFavorite = !_GasStationList[index].isFavorite;
                          });
                        },
                    )
                  )
              );
            },
          ),
      ),
    );
  }
}
class GasStation{
  var id;
  var name;
  var direction;
  var rating;
  var url;
  bool isFavorite=false;

  GasStation(name,direction,rating,id,url,isFavorite){
    this.direction=direction;
    this.name=name;
    this.rating=rating;
    this.id=id;
    this.url=url;
    this.isFavorite=isFavorite;
  }
}


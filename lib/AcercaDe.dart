import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de GasFinder'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // cuadro de diálogo de Acerca de
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Gas Finder S.A de C.V es una aplicación móvil diseñada para ayudarte a encontrar las estaciones de gasolina cercanas a tu ubicación. Con nuestra aplicación, puedes acceder a información en tiempo real sobre las gasolineras, incluyendo sus precios de combustible, ubicación en el mapa y reseñas de otros usuarios'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¡Bienvenido a Gas Finder!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Versión: 1.0.0',
                          style: TextStyle(color: Colors.grey),
                        ),
                        // Otros detalles sobre la aplicación aquí
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Se Cierra el cuadro de diálogo cuando se presiona "Cerrar"
                        Navigator.of(context).pop();
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Mostrar Acerca de GasFinder'),
        ),
      ),
    );
  }
}
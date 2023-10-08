import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class MiPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Cambia por la imagen de perfil real
              radius: 60,
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de Usuario', // Cambia por el nombre de usuario real
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Correo Electrónico', // Cambia por el correo electrónico real
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {


                // ********Agrega aquí la lógica para editar el perfil
              },
              child: Text('Editar Perfil'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Cerrar Sesión'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // ****************Agrega aquí la lógica para eliminar la cuenta
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Eliminar Cuenta'),
                      content: Text('¿Estás seguro de que deseas eliminar tu cuenta? Esta acción es irreversible.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Agrega aquí la lógica para confirmar y eliminar la cuenta
                            Navigator.of(context).pop(); // Cierra el diálogo
                          },
                          child: Text('Sí, Eliminar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Eliminar Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}

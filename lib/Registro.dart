import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_finder/Services/Firebase_services.dart';
import 'package:gas_finder/Start.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro>{

  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController correocontroller = TextEditingController(text: "");
  TextEditingController usuariocontroller = TextEditingController(text: "");
  TextEditingController passwordcontroller = TextEditingController(text: "");

  @override
  void dispose() {
    correocontroller.dispose();
    usuariocontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.senTextTheme(),
        ),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xff44587e),
                        Color(0xff3e4c6b),
                        Color(0xff303b52)
                      ]
                  ),
                ),
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Text("Registro",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),

                          ],
                        ) ,
                      ),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          controller: correocontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Correo Electrónico',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            prefixIcon: Icon(Icons.email),
                                          ),
                                        ),
                                        SizedBox(height: 40,),
                                        TextFormField(
                                          controller: usuariocontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Nombre de usuario',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                        ),
                                        SizedBox(height: 40,),
                                        TextFormField(
                                          controller: passwordcontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Contraseña',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            prefixIcon: Icon(Icons.lock),
                                          ),
                                        ),
                                        SizedBox(height: 40,),
                                        ElevatedButton(
                                          onPressed: () {
                                            SignUp();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffeebd3d),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            minimumSize: Size(double.infinity, 50),
                                          ),
                                          child: Text('Registrarse'),
                                        ),
                                        SizedBox(height: 20),
                                      ]
                                  )
                              )
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  void SignUp() async{
    String Correo = correocontroller.text;
    String Usuario = usuariocontroller.text;
    String Password = passwordcontroller.text;

    User? user = await auth.SignUpWithEmailAndPassword(Correo, Password);

    if (user != null){
      await addUser(correocontroller.text, usuariocontroller.text);
      print("El usuario fue creado exitosamente");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
    } else{
      print("Error! Algo ocurrió mal");
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_finder/Registro.dart';
import 'package:gas_finder/RestorePassword.dart';
import 'package:gas_finder/Start.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMessage = "";

  bool rememberMe = false;

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
              SizedBox(height: 140,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text("Bienvenido",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("Por favor ingresa con tu cuenta existente",style: TextStyle(color: Colors.white,fontSize: 15,),)
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
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
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
                          controller: passwordController,
                          obscureText: true,
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
                        SizedBox(height: 20,),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: rememberMe, // Cambia este valor según tu lógica
                              onChanged: (bool? newValue) {
                                setState(() {
                                  rememberMe=newValue!;
                                });
                              },
                            ),
                            Text(
                              'Recordarme',
                              style: TextStyle(fontSize: 14),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Lógica para el enlace de texto "Olvidé mi contraseña"
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Restore()
                                    ));
                              },
                              child: Text(
                                'Olvidé mi contraseña',
                                style: TextStyle(
                                  color: Color(0xffeebd3d),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            if (usernameController.text == 'admin' &&
                                passwordController.text == 'admin') {
                              // Aquí puedes navegar a la página de inicio
                              Navigator.of(context).pushReplacement(
                                CupertinoPageRoute(
                                  builder: (context) => Start(),
                                ),
                              );
                            } else {
                              setState(() {
                                errorMessage = "Credenciales incorrectas";
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffeebd3d),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text('Ingresar'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Lógica para el enlace de texto "Ya tienes cuenta ? Registrarme ahora"
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Registro()
                            ));
                          },
                          child: Text(
                            '¿No tienes una cuenta? Regístrate ahora',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
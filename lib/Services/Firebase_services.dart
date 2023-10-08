import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

addUser(String email, String name,) async {
  await db.collection("Usuarios").doc().set(
      {
        "Correo": email,
        "Nombre": name
      }
  );
}

class FirebaseAuthService{

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> SignUpWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential credenciales = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return credenciales.user;
    } catch (e){
      print("Error!...");
    }
    return null;
  }

  Future<User?> SignInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential credenciales = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credenciales.user;
    } catch (e){
      print("Error!...");
    }
    return null;
  }

  Future<void> ResetPassword (String email) async {
    try{
      await auth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      print("Ocurrio un error");
    }
  }
}

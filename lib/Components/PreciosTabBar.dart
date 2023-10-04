import 'package:flutter/material.dart';
import 'package:gas_finder/Models/PreciosModel.dart';

import '../Services/Api.dart';
import 'PreciosTabBarComponent.dart';

class PreciosTabBar extends StatelessWidget {
  const PreciosTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BarPreciosLista();
  }
}

class BarPreciosLista extends StatelessWidget {

  Future<List<PreciosModel>> PreciosLista = GetPrecios();
  @override
  Widget build(BuildContext context) {
    return  Center(
          child: FutureBuilder<List<PreciosModel>>(
            future: PreciosLista,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return PreciosTab(ListPrecioModel: snapshot.data,);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // Por defecto, muestra un loading spinner
              return CircularProgressIndicator();
            },
          ),
        );

  }
}
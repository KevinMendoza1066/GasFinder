import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_finder/Components/Precios.dart';
import '../Models/PreciosModel.dart';

class PreciosTab extends StatefulWidget {
  final List<PreciosModel>? ListPrecioModel;

  const PreciosTab({super.key,required this.ListPrecioModel});

  @override
  State<PreciosTab> createState() => _PreciosTabState();
}

class _PreciosTabState extends State<PreciosTab>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    final precioModel = widget.ListPrecioModel;
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final precioModel = widget.ListPrecioModel;
    return Scaffold(
      backgroundColor: Color(0xff15263b),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(precioModel![0].zona.toString(),style: TextStyle(fontSize: 35,color: Color(0xffFFFFFF),fontWeight: FontWeight.bold),),
                SizedBox(height: 60,),
                Precios(
                  tipoGasolina: precioModel![0].tipoGasolina.toString(),
                  valor: precioModel![0].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![1].tipoGasolina.toString(),
                  valor: precioModel![1].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![2].tipoGasolina.toString(),
                  valor: precioModel![2].valor.toString(),),
            ],)
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(precioModel![3].zona.toString(),style: TextStyle(fontSize: 35,color: Color(0xffFFFFFF),fontWeight: FontWeight.bold),),
                SizedBox(height: 60,),
                Precios(
                  tipoGasolina: precioModel![3].tipoGasolina.toString(),
                  valor: precioModel![3].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![4].tipoGasolina.toString(),
                  valor: precioModel![4].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![5].tipoGasolina.toString(),
                  valor: precioModel![5].valor.toString(),),
              ],)
          ),
          Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(precioModel![6].zona.toString(),style: TextStyle(fontSize: 35,color: Color(0xffFFFFFF),fontWeight: FontWeight.bold),),
                SizedBox(height: 60,),
                Precios(
                  tipoGasolina: precioModel![6].tipoGasolina.toString(),
                  valor: precioModel![6].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![7].tipoGasolina.toString(),
                  valor: precioModel![7].valor.toString(),),
                SizedBox(height: 20,),
                Precios(
                  tipoGasolina: precioModel![8].tipoGasolina.toString(),
                  valor: precioModel![8].valor.toString(),),
              ],)
          ),
        ],
      ),
    );
  }
}
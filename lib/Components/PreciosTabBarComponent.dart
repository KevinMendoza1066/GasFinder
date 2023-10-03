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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Precios(
                zona: precioModel![0].zona.toString(),
                tipoGasolina: precioModel![0].tipoGasolina.toString(),
                valor: precioModel![0].valor.toString(),),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
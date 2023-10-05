class PreciosModel {
   String zona="";
   String tipoGasolina="";
   String valor="";

   PreciosModel({required this.zona, required this.tipoGasolina,required this.valor});

   factory PreciosModel.fromJson(Map<String, dynamic> json) {
     return PreciosModel(
       zona: json['zona'],
       tipoGasolina: json['tipoGasolina'],
       valor: json['valor'],
     );
   }
}
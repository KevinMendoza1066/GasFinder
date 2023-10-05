import 'dart:convert';
import 'package:gas_finder/Models/PreciosModel.dart';
import 'package:http/http.dart' as http;

Future<List<PreciosModel>> GetPrecios() async {

  final response = await http.get(
    Uri.parse('http://gasfinderapi.somee.com/GasFinder/GetCurrentPrices'),
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    List<PreciosModel> preciosList = jsonResponse.map((json) => PreciosModel.fromJson(json)).toList();
    return preciosList;
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }
}
import 'package:cotacaocambio/util/exchange.dart';
import 'package:flutter/material.dart';

Widget form(Exchange exchange){
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dollar_buy = exchange.dollar;
  double euro_buy = exchange.euro;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dollar_buy).toStringAsFixed(2);
    euroController.text = (real / euro_buy).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * dollar_buy).toStringAsFixed(2);
    euroController.text = (dolar * dollar_buy / euro_buy).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * euro_buy).toStringAsFixed(2);
    dolarController.text = (euro * euro_buy / dollar_buy).toStringAsFixed(2);
  }


  return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Icon(Icons.monetization_on,
              size: 150.0, color: Colors.amber),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Reals", "R\$", realController, _realChanged),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Dollars", "US\$", dolarController, _dolarChanged),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Euros", "€", euroController, _euroChanged),
          ),
        ],
      ));
}

Widget buildTextField(
    String label, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: f,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
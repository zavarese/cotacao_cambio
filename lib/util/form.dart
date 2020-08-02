import 'package:cotacaocambio/util/exchange.dart';
import 'package:flutter/material.dart';

Widget form(Exchange exchange){
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final libraController = TextEditingController();

  double dollar_buy = exchange.dollar;
  double euro_buy = exchange.euro;
  double libra_buy = exchange.libra;

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    libraController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dollar_buy).toStringAsFixed(2);
    euroController.text = (real / euro_buy).toStringAsFixed(2);
    libraController.text = (real / libra_buy).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * dollar_buy).toStringAsFixed(2);
    euroController.text = (dolar * dollar_buy / euro_buy).toStringAsFixed(2);
    libraController.text = (dolar * dollar_buy / libra_buy).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * euro_buy).toStringAsFixed(2);
    dolarController.text = (euro * euro_buy / dollar_buy).toStringAsFixed(2);
    libraController.text = (euro * euro_buy / libra_buy).toStringAsFixed(2);
  }

  void _libraChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double libra = double.parse(text);
    realController.text = (libra * libra_buy).toStringAsFixed(2);
    dolarController.text = (libra * libra_buy / dollar_buy).toStringAsFixed(2);
    euroController.text = (libra * libra_buy / euro_buy).toStringAsFixed(2);
  }


  return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Icon(Icons.account_balance,
              size: 150.0, color: Colors.amber),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Real", "R\$", realController, _realChanged),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Dollar", "US\$", dolarController, _dolarChanged),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Euro", "€", euroController, _euroChanged),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(
                "Pound", "£", libraController, _libraChanged),
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
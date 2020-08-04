
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

Widget textField(String label, String prefix, TextEditingController c, Function f, bool enable, String nome) {
  return TextField(

    enabled: enable,
    controller: c,
    inputFormatters: [
      WhitelistingTextInputFormatter.digitsOnly,
      //fazer o formater para dinheiro
      CurrencyInputFormatter()
    ],
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey,
      icon: bandeira(label),
      labelText: nome,
      labelStyle: TextStyle(color: Colors.black),
      prefixText: prefix,
      prefixStyle: const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    style: TextStyle(color: Colors.black, fontSize: 20.0),
    onChanged: f,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}

Image bandeira(String imagem) {
  AssetImage asset = AssetImage('assets/'+imagem+'.png');
  Image image = Image(
    image: asset,
    width: 30,
  );
  return image;
}

Image simbolo() {
  AssetImage asset = AssetImage('assets/cambio.png');
  Image image = Image(
    image: asset,
    width: 150,
    height: 150,
  );
  return image;
}

class CurrencyInputFormatter extends TextInputFormatter {

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.selection.baseOffset == 0){
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat("#,##0.00", "pt_BR");

    String newText = formatter.format(value/100);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}


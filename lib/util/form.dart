import 'package:cotacaocambio/util/exchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

Widget form(Exchange exchange){
  final realContr = TextEditingController();
  final dolarContr = TextEditingController();
  final euroContr = TextEditingController();
  final libraContr = TextEditingController();
  final pesoContr = TextEditingController();

  final formatter = NumberFormat("#,##0.00", "pt_BR");

  double dolar_compra = exchange.dolar;
  double euro_compra = exchange.euro;
  double libra_compra = exchange.libra;
  double peso_compra = exchange.peso;

  void _clearAll() {
    realContr.text = "";
    dolarContr.text = "";
    euroContr.text = "";
    libraContr.text = "";
    pesoContr.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double real = double.parse(text);

    dolarContr.text = formatter.format(real / dolar_compra);
    euroContr.text = formatter.format(real / euro_compra);
    libraContr.text = formatter.format(real / libra_compra);
    pesoContr.text = formatter.format(real / peso_compra);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double dolar = double.parse(text);
    realContr.text = formatter.format(dolar * dolar_compra);
    euroContr.text = formatter.format(dolar * dolar_compra / euro_compra);
    libraContr.text = formatter.format(dolar * dolar_compra / libra_compra);
    pesoContr.text = formatter.format(dolar * dolar_compra / peso_compra);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double euro = double.parse(text);
    realContr.text = formatter.format(euro * euro_compra);
    dolarContr.text = formatter.format(euro * euro_compra / dolar_compra);
    libraContr.text = formatter.format(euro * euro_compra / libra_compra);
    pesoContr.text = formatter.format(euro * euro_compra / peso_compra);
  }

  void _libraChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double libra = double.parse(text);
    realContr.text = formatter.format(libra * libra_compra);
    dolarContr.text = formatter.format(libra * libra_compra / dolar_compra);
    euroContr.text = formatter.format(libra * libra_compra / euro_compra);
    pesoContr.text = formatter.format(libra * libra_compra / peso_compra);
  }

  void _pesoChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double peso = double.parse(text);
    realContr.text = formatter.format(peso * peso_compra);
    dolarContr.text = formatter.format(peso * peso_compra / dolar_compra);
    euroContr.text = formatter.format(peso * peso_compra / euro_compra);
    libraContr.text = formatter.format(peso * peso_compra / libra_compra);
  }


  return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          simbolo(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField("br", "R\$", realContr, _realChanged, true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField("us", "US\$", dolarContr, _dolarChanged, true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField("eu", "€", euroContr, _euroChanged, true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField("gb", "£", libraContr, _libraChanged, true),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textField("ar", "\$", pesoContr, _pesoChanged, true),
          ),
        ],
      ));
}

Widget textField(String label, String prefix, TextEditingController c, Function f, bool enable) {
  return TextField(

    enabled: enable,
    controller: c,
    inputFormatters: [
      WhitelistingTextInputFormatter.digitsOnly,
      //fazer o formater para dinheiro
      CurrencyInputFormatter()
    ],
    decoration: InputDecoration(
        icon: bandeira(label),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        prefixText: prefix,
        prefixStyle: const TextStyle(color: Colors.greenAccent, fontSize: 20.0),
    ),
    style: TextStyle(color: Colors.white, fontSize: 20.0),
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
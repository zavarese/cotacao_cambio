import 'package:cotacaocambio/util/exchange.dart';
import 'package:cotacaocambio/util/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';


Widget form(Exchange exchange){
  final realContr = TextEditingController();
  final dolarContr = TextEditingController();
  final euroContr = TextEditingController();
  final libraContr = TextEditingController();
  final pesoContr = TextEditingController();
  final bitcoinContr = TextEditingController();

  final formatter = NumberFormat("#,##0.00", "pt_BR");

  double dolar_compra = exchange.dolar;
  double euro_compra = exchange.euro;
  double libra_compra = exchange.libra;
  double peso_compra = exchange.peso;
  double bitcoin_compra = exchange.bitcoin;

  Map<String, double> mapa = {'IBOVESPA': exchange.ibovespa,
                              'NASDAQ': exchange.nasdaq,
                              'CAC': exchange.cac,
                              'NIKKEY': exchange.nikkey};

  //var list = [];
  //mapa.entries.forEach((e) => list.add(Bolsa(name: e.key.toString(), variacao: e.value.toDouble())));
  //list = mapa.entries.map((e) => Bolsa(name: e.key.toString(), variacao: e.value.toDouble())).toList();


  void _clearAll() {
    realContr.text = "";
    dolarContr.text = "";
    euroContr.text = "";
    libraContr.text = "";
    pesoContr.text = "";
    bitcoinContr.text = "";
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
    bitcoinContr.text = formatter.format(real / bitcoin_compra);
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
    bitcoinContr.text = formatter.format(dolar * dolar_compra / bitcoin_compra);
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
    bitcoinContr.text = formatter.format(euro * euro_compra / bitcoin_compra);
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
    bitcoinContr.text = formatter.format(libra * libra_compra / bitcoin_compra);
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
    bitcoinContr.text = formatter.format(peso * peso_compra / bitcoin_compra);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    text = text.replaceAll('.','');
    text = text.replaceAll(',','.');

    double bitcoin = double.parse(text);
    realContr.text = formatter.format(bitcoin * bitcoin_compra);
    dolarContr.text = formatter.format(bitcoin * bitcoin_compra / dolar_compra);
    euroContr.text = formatter.format(bitcoin * bitcoin_compra / euro_compra);
    libraContr.text = formatter.format(bitcoin * bitcoin_compra / libra_compra);
    pesoContr.text = formatter.format(bitcoin * bitcoin_compra / peso_compra);
  }


  return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Center(child: simbolo()),
          ),
          ListTile(
            title: textField("br", "R\$", realContr, _realChanged, true, "Real"),
          ),
          ListTile(
            title: textField("us", "US\$", dolarContr, _dolarChanged, true, "Dollar"),
          ),
          ListTile(
            title: textField("eu", "€", euroContr, _euroChanged, true, "Euro"),
          ),
          ListTile(
            title: textField("gb", "£", libraContr, _libraChanged, true, "Pound"),
          ),
          ListTile(
            title: textField("ar", "\$", pesoContr, _pesoChanged, true, "Peso"),
          ),
          ListTile(
            title: textField("bc", "₿", bitcoinContr, _bitcoinChanged, true, "Bitcoin"),
          ),
          ListTile(),
          ListTile(
            title: CarouselSlider(
              options: CarouselOptions(
                  height: 30.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
              ),
              items: mapa.entries.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white10
                        ),
                        child: Text(
                            i.key.toString()+": "+i.value.toString(),
                          style: TextStyle(
                              fontSize: 26.0,
                              color: Colors.amber
                          ),
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
}


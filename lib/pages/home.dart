
import 'package:cotacaocambio/util/exchange.dart';
import 'file:///C:/Users/zavar/AndroidStudioProjects/cotacao_cambio/lib/pages/form.dart';
import 'package:cotacaocambio/util/service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/cambio.png'), // you can put Icon as well, it accepts any widget.
        title: Text ("Financial Indicators"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                      "Carregando...",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                        "Erro :(",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ));
                } else {

                  return form(getExchange(snapshot));
                }
            }
          }),
    );
  }
}
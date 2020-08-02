
import 'package:cotacaocambio/util/exchange.dart';
import 'package:cotacaocambio/util/form.dart';
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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Exchange"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          //snapshot of the context/getData
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
              default:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                        "Error :(",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
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
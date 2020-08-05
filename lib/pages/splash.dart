import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var teste = 0;
    return Container(
        color: Colors.black,
        child: Center(
          child: Container(
            decoration: BoxDecoration (
              color: Colors.black,
            ),
            width: 250,
            height: 250,
            child: Image.asset("assets/cambio.png"),
          ),
        )
    );
  }
}


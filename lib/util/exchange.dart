
class Exchange  {
  double peso = 0;
  double dolar = 0;
  double euro = 0;
  double libra = 0;
  String result = "";

  Exchange({
    this.peso,
    this.dolar,
    this.euro,
    this.libra,
    this.result,
  });
}

Exchange getExchange (snapshot) {

  double peso = 0;
  double dolar = 0;
  double euro = 0;
  double libra = 0;
  String result = "Ok";

  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
  libra = snapshot.data["results"]["currencies"]["GBP"]["buy"];
  peso = snapshot.data["results"]["currencies"]["ARS"]["buy"];
  return Exchange(peso: peso, dolar:dolar, euro: euro, libra: libra, result: result);
}
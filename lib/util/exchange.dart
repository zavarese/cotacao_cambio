
class Exchange  {
  double dollar = 0;
  double euro = 0;
  double libra = 0;
  String result = "";

  Exchange({
    this.dollar,
    this.euro,
    this.libra,
    this.result,
  });
}

Exchange getExchange (snapshot) {


  double dollar = 0;
  double euro = 0;
  double libra = 0;
  String result = "Ok";

  dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
  libra = snapshot.data["results"]["currencies"]["GBP"]["buy"];
  return Exchange(dollar:dollar, euro: euro, libra: libra, result: result);
}
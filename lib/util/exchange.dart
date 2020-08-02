
class Exchange  {
  double dollar = 0;
  double euro = 0;
  String result = "";

  Exchange({
    this.dollar,
    this.euro,
    this.result,
  });
}

Exchange getExchange (snapshot) {

  double dollar = 0;
  double euro = 0;
  String result = "Ok";

  dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
  return Exchange(dollar:dollar, euro: euro, result: result);
}
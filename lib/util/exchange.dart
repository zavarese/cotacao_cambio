
class Exchange  {
  double peso = 0;
  double dolar = 0;
  double euro = 0;
  double libra = 0;
  double bitcoin = 0;
  double ibovespa = 0;
  double nasdaq = 0;
  double cac = 0;
  double nikkey = 0;
  String result = "";

  Exchange({
    this.peso,
    this.dolar,
    this.euro,
    this.libra,
    this.bitcoin,
    this.ibovespa,
    this.nasdaq,
    this.cac,
    this.nikkey,
    this.result,
  });
}

Exchange getExchange (snapshot) {

  double peso = 0;
  double dolar = 0;
  double euro = 0;
  double libra = 0;
  double bitcoin = 0;
  double ibovespa = 0;
  double nasdaq = 0;
  double cac = 0;
  double nikkey = 0;
  String result = "Ok";

  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
  libra = snapshot.data["results"]["currencies"]["GBP"]["buy"];
  peso = snapshot.data["results"]["currencies"]["ARS"]["buy"];
  bitcoin = snapshot.data["results"]["currencies"]["BTC"]["buy"];
  ibovespa = snapshot.data["results"]["stocks"]["IBOVESPA"]["variation"];
  nasdaq = snapshot.data["results"]["stocks"]["NASDAQ"]["variation"];
  cac = snapshot.data["results"]["stocks"]["CAC"]["variation"];
  nikkey = snapshot.data["results"]["stocks"]["NIKKEI"]["variation"];

  return Exchange(
      peso: peso,
      dolar:dolar,
      euro: euro,
      libra: libra,
      bitcoin: bitcoin,
      ibovespa: ibovespa ,
      nasdaq: nasdaq,
      cac: cac,
      nikkey: nikkey,
      result: result
  );
}
import 'package:bitcoin_ticker/services/networkHelper.dart';
import 'package:flutter/material.dart';

class CurrencyConverter {
  CurrencyConverter({@required this.currency, @required this.coin});

  final String currency;
  final String coin;

  Future getExchangeRate() async {
    String key = "D2B7DC7A-8F76-42DE-9699-903A3E5E64A7";
    String url =
        "https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$key";

    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;
  }
}

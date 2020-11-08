import 'package:flutter/material.dart';

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  List<String> currenciesList = [
    'AUD',
    'BRL',
    'CAD',
    'CNY',
    'EUR',
    'GBP',
    'HKD',
    'IDR',
    'ILS',
    'INR',
    'JPY',
    'MXN',
    'NOK',
    'NZD',
    'PLN',
    'RON',
    'RUB',
    'SEK',
    'SGD',
    'USD',
    'ZAR'
  ];

  List<DropdownMenuItem<String>> addCurrencyAndroid() {
    List<DropdownMenuItem<String>> tempList = [];
    for (String currency in currenciesList) {
      tempList.add(
        DropdownMenuItem<String>(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return tempList;
  }

  List<Text> addCurrencyApple() {
    List<Text> tempList = [];
    for (String currency in currenciesList) {
      tempList.add(
        Text(currency),
      );
    }
    return tempList;
  }
}

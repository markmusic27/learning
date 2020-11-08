import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = "USD";
  double exchangeRateBTC;
  double exchangeRateETH;
  double exchangeRateLTC;

  List<DropdownMenuItem<String>> getCurrencyListAndrioid() {
    CoinData coinData = CoinData();

    return coinData.addCurrencyAndroid();
  }

  List<Text> getCurrencyListApple() {
    CoinData coinData = CoinData();

    return coinData.addCurrencyApple();
  }

  String getCurrencyOnIndex(int index) {
    List<String> currencyList = CoinData().currenciesList;

    return currencyList[index];
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: currency,
      items: getCurrencyListAndrioid(),
      onChanged: (value) {
        setState(() {
          currency = value;
        });
        updateUI();
      },
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      children: getCurrencyListApple(),
      itemExtent: 35,
      onSelectedItemChanged: (value) {
        setState(() {
          currency = getCurrencyOnIndex(value);
        });
        updateUI();
      },
    );
  }

  void getData() async {
    CurrencyConverter suTATA = CurrencyConverter(coin: "BTC", currency: "USD");
    suTATA.getExchangeRate();
  }

  Widget getPicker() {
    return Platform.isIOS ? iOSPicker() : androidDropdown();
  }

  Future<double> getExchangeRate(String coin) async {
    CurrencyConverter currencyConverter =
        CurrencyConverter(coin: coin, currency: currency);
    var currencyData = await currencyConverter.getExchangeRate();
    return currencyData["rate"];
  }

  void updateUI() async {
    double vala = await getExchangeRate("BTC");
    double valb = await getExchangeRate("ETH");
    double valc = await getExchangeRate("LTC");
    setState(() {
      exchangeRateBTC = vala;
      exchangeRateETH = valb;
      exchangeRateLTC = valc;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomCard(
                  "1 BTC = ${exchangeRateBTC == null ? "?" : exchangeRateBTC.toStringAsFixed(0)} $currency"),
              CustomCard(
                  "1 ETH = ${exchangeRateETH == null ? "?" : exchangeRateETH.toStringAsFixed(0)} $currency"),
              CustomCard(
                  "1 LTC = ${exchangeRateLTC == null ? "?" : exchangeRateLTC.toStringAsFixed(0)} $currency"),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard(this.textUsed);
  final String textUsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            textUsed,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
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

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '1E7D0C26-D813-4785-A265-CF0FB3E06DB1';

const List<String> coinTypes = [
  'BTC',
  'ETH',
  'LTC'
];

class CoinData {

  Future getData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String coin in coinTypes) {
      http.Response response = await http.get(
          Uri.parse("$coinAPIURL/$coin/$currency?apikey=$apiKey"));

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);

        double price = decodedData['rate'];
        cryptoPrices[coin] = price.toStringAsFixed(0);
      }
      else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }

}
import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinGeckoService {
  final String baseUrl = 'https://api.coingecko.com/api/v3';

  // Fetch the price of a cryptocurrency
  Future<double?> fetchCryptoPrice(String cryptoId, String currency) async {
    final url = Uri.parse('$baseUrl/simple/price?ids=$cryptoId&vs_currencies=$currency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data[cryptoId][currency].toDouble();
    } else {
      print('Failed to fetch price: ${response.statusCode}');
      return null;
    }
  }
}

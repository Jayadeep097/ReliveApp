import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  final String _baseUrl = 'https://api.coingecko.com/api/v3/simple/price';

  Future<Map<String, dynamic>> fetchCryptoPrice(String crypto, String currency) async {
    final url = '$_baseUrl?ids=$crypto&vs_currencies=$currency';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch crypto prices');
    }
  }
}

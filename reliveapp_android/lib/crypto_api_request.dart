import 'package:http/http.dart' as http;
import 'dart:developer';

Future<void> fetchCryptoData() async {
  final url = Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd');
  final response = await http.get(url, headers: {
    'Authorization': 'Bearer CG-6ECfu28PH4qy8uC3zA2PUguK',
  });

  if (response.statusCode == 200) {
    log(response.body);
  } else {
    log("Fetching data...");
  }
}

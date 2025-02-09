import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String _apiKey = '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';

  // Generate AI Response
  Future<String> getUserInsight(String prompt) async {
    const url = 'https://api.openai.com/v1/completions';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'text-davinci-003',
        'prompt': prompt,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['choices'][0]['text'];
    } else {
      throw Exception('Failed to fetch AI response: ${response.statusCode}');
    }
  }
}

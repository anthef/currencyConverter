import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String apiKey = 'fc918f29a87fd36b44df9c55'; // Replace with your API key
  final String baseUrl = 'https://v6.exchangerate-api.com/v6';

  Future<Map<String, dynamic>> fetchRates(String baseCurrency) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$apiKey/latest/$baseCurrency'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}

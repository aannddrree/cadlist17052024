import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'http://localhost:8080/api/v1';

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('$apiUrl/items'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> saveData(String data) async {
    final response = await http.post(
      Uri.parse('$apiUrl/data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'data': data,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save data');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
class ChatGPTService {
  final String apiKey;

  ChatGPTService({required this.apiKey});

  Future<String> sendMessage(String message) async {
    const String apiUrl = "https://api.openai.com/v1/chat/completions"; // OpenAI's API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo", // Change model to your preference (e.g., gpt-4)
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": message}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception("Failed to fetch response: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Error communicating with API: $e");
    }
  }

}
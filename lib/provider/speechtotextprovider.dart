import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpeechToTextProvider with ChangeNotifier {
  stt.SpeechToText _speech = stt.SpeechToText();
  String _text = 'Voice note';
  String _translatedText = 'Translated text';
  bool _isListening = false;
  String _selectedLanguage = 'en';

  String get text => _text;
  String get translatedText => _translatedText;
  bool get isListening => _isListening;
  String get selectedLanguage => _selectedLanguage;

  void updateSelectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  Future<void> toggleListening() async {
    if (_isListening) {
      await _stopListening();
    } else {
      await _startListening();
    }
    notifyListeners();
  }

  Future<void> _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Listening status: $status');
      },
      onError: (error) {
        print('Listening error: $error');
      },
    );

    if (available) {
      _isListening = true;

      _speech.listen(
        onResult: (result) async {
          _text = result.recognizedWords;
          await _translateText();
          notifyListeners();
        },
      );
    } else {
      print('Speech recognition is not available');
    }
  }

  Future<void> _stopListening() async {
    await _speech.stop();
    _isListening = false;
    notifyListeners();
  }

  Future<void> _translateText() async {
    final String apiUrl =
        "https://deep-translate1.p.rapidapi.com/language/translate/v2";

    final Map<String, dynamic> payload = {
      "q": _text,
      "source": "en",
      "target": _selectedLanguage,
    };

    final Map<String, String> headers = {
      "x-rapidapi-key": "677e81e9c9msh70dff0bdfb0b8a8p1ec20fjsn0c09e57db105",
      "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
      "Content-Type": "application/json",
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      _translatedText = data['data']['translations']['translatedText'];
    } else {
      _translatedText =
      'Failed to translate text. Status code: ${response.statusCode}';
    }
  }
}

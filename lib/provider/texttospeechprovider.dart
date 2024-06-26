import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechProvider extends ChangeNotifier {
  final FlutterTts flutterTts = FlutterTts();
  String text = '';
  String selectedLanguage = 'en-US';
  bool isSpeaking = false;

  Future<void> speak() async {
    await flutterTts.setLanguage(selectedLanguage);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    isSpeaking = true;
    notifyListeners();
  }

  Future<void> pause() async {
    await flutterTts.pause();
    isSpeaking = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isSpeaking = false;
    notifyListeners();
  }
}



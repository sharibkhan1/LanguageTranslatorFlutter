import 'package:flutter/material.dart';
import 'package:languagetranslator/provider/speechtotextprovider.dart';
import 'package:provider/provider.dart';

class SpeechToTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpeechToTextProvider(),
      child: Consumer<SpeechToTextProvider>(
        builder: (context, state, _) => Scaffold(
          appBar: AppBar(
            title: Text('Speech to Text'),
            actions: [
              DropdownButton<String>(
                value: state.selectedLanguage,
                items: {
                  'English': 'en',
                  'Hindi': 'hi',
                  'Spanish': 'es',
                  'Tamil': 'ta',
                }.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.value,
                    child: Text(entry.key),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    state.updateSelectedLanguage(newValue);
                  }
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Recognized Text: ${state.text}'),
                SizedBox(height: 20),
                Text('Translated Text: ${state.translatedText}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: state.toggleListening,
                  child: Text(state.isListening ? 'Stop Listening' : 'Start Listening'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

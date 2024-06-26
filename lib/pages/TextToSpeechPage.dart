import 'package:flutter/material.dart';
import 'package:languagetranslator/provider/texttospeechprovider.dart';
import 'package:provider/provider.dart';

class TextToSpeechPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<TextToSpeechProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<TextToSpeechProvider>(
              builder: (context, provider, child) {
                return TextField(
                  onChanged: (value) {
                    provider.text = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter text',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Consumer<TextToSpeechProvider>(
              builder: (context, provider, child) {
                return DropdownButton<String>(
                  value: provider.selectedLanguage,
                  onChanged: (value) {
                    provider.selectedLanguage = value!;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'en-US',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'es-ES',
                      child: Text('Spanish'),
                    ),
                    DropdownMenuItem(
                      value: 'hi-IN',
                      child: Text('Hindi'),
                    ),
                    DropdownMenuItem(
                      value: 'ur-PK',
                      child: Text('Urdu'),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Consumer<TextToSpeechProvider>(
              builder: (context, provider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: provider.speak,
                      child: Text('Speak'),
                    ),
                    ElevatedButton(
                      onPressed: provider.pause,
                      child: Text('Pause'),
                    ),
                    ElevatedButton(
                      onPressed: provider.stop,
                      child: Text('Stop'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
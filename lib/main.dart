import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:languagetranslator/navbar/navbar.dart';
import 'package:languagetranslator/provider/TranslationProvider.dart';
import 'package:languagetranslator/provider/speechtotextprovider.dart';
import 'package:languagetranslator/provider/texttospeechprovider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TranslationProvider()),
        ChangeNotifierProvider(create: (_) => SpeechToTextProvider()),
        ChangeNotifierProvider(create: (_) => TextToSpeechProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(),
      ),
    );
  }
}
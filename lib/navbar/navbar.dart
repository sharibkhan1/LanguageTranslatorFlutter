import 'package:flutter/material.dart';
import 'package:languagetranslator/pages/SpeechToTextPage.dart';
import 'package:languagetranslator/pages/TextToSpeechPage.dart';
import 'package:languagetranslator/pages/TranslationPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    TranslationPage(),
    TextToSpeechPage(),
    SpeechToTextPage(),  // Placeholder for the third page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Color(0xFFA4BFA7),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: SalomonBottomBar(
          // backgroundColor: Color(0xff2979FF),
          // selectedItemColor: Colors.black,
          // unselectedItemColor:Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.translate,size: 27,),
              title: Text("Translate"),
              selectedColor: Colors.black,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.text_fields,size: 27,),
              title: Text("Text"),
              selectedColor: Colors.black,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.audiotrack,size: 27,),
              title: Text("Audio"),
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

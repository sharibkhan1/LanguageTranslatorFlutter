# Multilingual Translation App

### This project is a multilingual translation application built using Flutter. It provides the following features:

#### 1.Language Translation of UI:
 Translates the user interface into multiple languages.

#### 2.User Text Translation:
 Translates user input text using an API.

#### 3.Text-to-Speech:
 Converts text into speech in different languages using Flutter libraries.

#### 4.Speech-to-Text:
 Converts spoken language into different languages text using Flutter libraries.


## Setup and Run Instructions

### Prerequisites
1. Flutter SDK
2. API key for the translation service (RapidAPI key)


## Installation

### 1.Clone the repository:

git clone https://github.com/sharibkhan1/LanguageTranslatorFlutter.git

cd LanguageTranslatorFlutter

### 2.Install dependencies:

flutter pub get

### 3.Configure the API key:

1. Open 'lib/provider/TranslationProvider.dart'.

2. Add your API key in the headers:



final Map<String, String> headers = {

 "x-rapidapi-key": "YOUR_API_KEY",

  "x-rapidapi-host": "deep-translate1.p.rapidapi.com",

 "Content-Type": "application/json",

 };

### 4.Running the App

flutter run

## Explanation of AI Tools Used

### ChatGPT

This project utilizes OpenAI's ChatGPT for enhancing the translation accuracy and providing natural language processing capabilities. The rationale for using ChatGPT includes:

High Accuracy: ChatGPT offers state-of-the-art performance in understanding and generating human-like text.
Ease of Integration: The API is straightforward to use and integrate with existing Flutter applications.

## Challenges Faced and Solutions

### Challenge 1: API Integration

#### Issue:
 Integrating the translation API with Flutter.

#### Solution:
 Followed the API documentation and used Flutter's **'http'** package to handle API requests and responses.

### Challenge 2: Managing State for Multiple Languages

#### Issue:
 Maintaining the state of selected languages across different pages.

#### Solution:
 Utilized Flutter's state management solution, Provider, to ensure consistent language selection throughout the app.

### Challenge 3: Text-to-Speech and Speech-to-Text Implementation

#### Issue:
 Ensuring accurate text-to-speech and speech-to-text conversion for multiple languages.
#### Solution:
 Used Flutter plugins like **"flutter_tts"** for text-to-speech and **"speech_to_text"** for speech-to-text, and fine-tuned the configurations for different languages.

## Video 

### Highlight key features of your app.

https://github.com/sharibkhan1/LanguageTranslatorFlutter/assets/114480935/d880cd0f-8b34-4490-ab42-0cbd9d2042cb

## Code Overview

### main.dart
Sets up the main entry point of the application, initializes providers, and sets up the navigation bar.

### NavBar.dart
Defines the navigation bar with three main pages: Translation, Text-to-Speech, and Speech-to-Text.

### SpeechToTextProvider.dart
Handles the logic for converting speech to text using the speech_to_text package.

### TextToSpeechProvider.dart
Handles the logic for converting text to speech using the flutter_tts package.

### TranslationProvider.dart
Handles the logic for translating text and UI elements using an API from RapidAPI.

### TranslationPage.dart
Provides the UI for translating user input text and displaying translated text.

### TextToSpeechPage.dart
Provides the UI for entering text and converting it to speech in different languages.

### SpeechToTextPage.dart
Provides the UI for converting speech to text.


## Conclusion

This multilingual translation app demonstrates the effective use of Flutter for building a multilingual user interface and integrating powerful AI tools like ChatGPT for enhancing translation capabilities. The project highlights the seamless integration of API services and robust state management within a Flutter application.











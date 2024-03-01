import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tour_maurice/screens/openai_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  final OpenAIService openAIService = OpenAIService();
  List<Map<String, String>> messages = [];
  bool _isListening = false;
  String lastWords = '';
  String? generatedContent;
  String? generatedImageUrl;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await _speech.initialize();
    setState(() {});
  }

  void startListening() async {
    await _speech.listen(onResult: onSpeechResult);
    setState(() {});
  }

  void stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habé Assistance Vocale'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (messages.isEmpty && !_isListening)
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        'assets/voice_logo.png', // Remplacez par le chemin de votre logo
                        width: 100,
                        height: 100,
                        // Assurez-vous d'ajuster la taille de votre logo selon vos besoins
                      ),
                    ),
                  ),
                if (messages.isEmpty && !_isListening)
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Je suis Habé, comment pourrai-je vous aider aujourd\'hui?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (messages.isEmpty && !_isListening)
                  const SizedBox(
                      height: 20), // Ajout d'un espace entre les blocs de texte
                if (messages.isEmpty && !_isListening)
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 194, 225, 239), // Changement de couleur
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Je suis à votre disposition pour vous aider davantages dans votre tour Maurice',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Texte en gras
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!(messages.isEmpty && !_isListening))
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Align(
                            alignment: message['type'] == 'user'
                                ? Alignment.topRight
                                : Alignment.bottomLeft,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: message['type'] == 'user'
                                    ? const Color.fromARGB(255, 161, 205, 241)
                                    : const Color.fromARGB(255, 242, 251, 242),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                message['text']!,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 31, 11, 11)),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: messages.length,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleListening,
        child: const Icon(Icons.mic),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _startListening() {
    setState(() {
      _isListening = true;
    });

    _speech.listen(
      onResult: (result) async {
        setState(() {
          if (result.finalResult) {
            messages.add({'text': result.recognizedWords, 'type': 'user'});
          }
        });

        _processUserRequest(result.recognizedWords);

        setState(() {});
      },
    );
  }

  void _processUserRequest(String userRequest) async {
    if (isArtRelated(userRequest)) {
      if (isDALLERelated(userRequest)) {
        final response = await openAIService.dallEAPI(userRequest);
        if (response.contains('https')) {
          setState(() {
            generatedImageUrl = response;
            generatedContent = null;
          });
        } else {
          _handleAssistantResponse(response);
        }
      } else {
        final response = await openAIService.isArtPromptAPI(userRequest);
        if (response.contains('https')) {
          setState(() {
            generatedImageUrl = response;
            generatedContent = null;
          });
        } else {
          _handleAssistantResponse(response);
        }
      }
    } else {
      final response = await openAIService.chatGPTAPI(userRequest);
      if (response.contains('https')) {
        setState(() {
          generatedImageUrl = response;
          generatedContent = null;
        });
      } else {
        _handleAssistantResponse(response);
      }
    }
  }

  void _handleAssistantResponse(String response) async {
    messages.add({'text': response, 'type': 'assistant'});
    await _speak(response);
    setState(() {});
  }

  bool isArtRelated(String text) {
    text = text.toLowerCase();

    List<String> artKeywords = [
      'art',
      'image',
      'peinture',
      'dessin',
      'sculpture'
    ];

    for (String keyword in artKeywords) {
      if (text.contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  bool isDALLERelated(String text) {
    text = text.toLowerCase();
    List<String> dalleKeywords = [
      'image',
      'génération d\'image',
      'création d\'image',
      'graphique'
    ];
    for (String keyword in dalleKeywords) {
      if (text.contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });

    _speech.stop();
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    super.dispose();
    _speech.stop();
    flutterTts.stop();
  }
}

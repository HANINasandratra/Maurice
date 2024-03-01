import 'package:flutter/material.dart';
import 'package:tour_maurice/screens/attractions_screen.dart'
    as AttractionsScreen;
import 'package:tour_maurice/screens/plages_screen.dart' as PlagesScreen;
import 'package:tour_maurice/screens/hotels_screen.dart' as HotelsScreen;
import 'package:tour_maurice/screens/street_food_screen.dart'
    as StreetFoodScreen;
import 'package:tour_maurice/screens/langue_screen.dart' as LangueScreen;
import 'package:tour_maurice/screens/recherche_screen.dart' as RechercheScreen;
import 'package:tour_maurice/screens/profile_screen.dart' as ProfileScreen;
import 'package:tour_maurice/screens/chat_screen.dart' as ChatScreen;
import 'package:tour_maurice/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Maurice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      home: const SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? _buildAppBar() : null,
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Langue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0, top: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            _onMicButtonPressed();
          },
          backgroundColor: Colors.blue,
          child: Icon(_isListening ? Icons.mic_none : Icons.mic),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/logo-tours_Trans.png',
            height: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            'Tour Maurice',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              // Ajoutez ici le code pour gérer le clic sur le bouton d'icône chat
              print('Bouton d\'icône chat cliqué');
              // Naviguer vers la page de chat
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatScreen.ChatScreen()),
              );
            },
            child: const Icon(
              Icons.chat,
              size: 26.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return ListView(
          children: [
            customButton('Attractions', 'assets/attractions.gif',
                const AttractionsScreen.AttractionsScreen()),
            customButton('Plages', 'assets/plage.gif',
                const PlagesScreen.PlagesScreen()),
            customButton('Hôtels', 'assets/hotel.gif',
                const HotelsScreen.HotelsScreen()),
            customButton('Street Food', 'assets/street_foods.gif',
                const StreetFoodScreen.StreetFoodScreen()),
          ],
        );
      case 1:
        return const LangueScreen.LangueScreen();
      case 2:
        return const RechercheScreen.RechercheScreen();
      case 3:
        return const ProfileScreen.ProfileScreen();
      default:
        return const Center(
          child: Text('Page Inconnue'),
        );
    }
  }

  Widget customButton(String text, String imagePath, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: 600,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void _onMicButtonPressed() {
    setState(() {
      _isListening = !_isListening;
    });

    if (_isListening) {
      // Code à exécuter lorsqu'on commence à écouter
      print('Microphone listening started');
    } else {
      // Code à exécuter lorsqu'on arrête d'écouter
      print('Microphone listening stopped');
      if (!_isListening) {
        // Naviguer vers la page de chat après avoir arrêté l'écoute
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ChatScreen.ChatScreen()),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyAppWrapper extends StatelessWidget {
  final String initialLanguageCode;

  const MyAppWrapper({Key? key, required this.initialLanguageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism Assistance Vocal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo-tours_Trans.png',
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'Tourism Assistance Vocal',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          } else {
            // Gérer la navigation pour les autres onglets
          }
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
    );
  }

  // Fonction pour retourner le contenu de la page en fonction de l'onglet sélectionné
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const AttractionsScreen();
      case 1:
        return const LangueScreen();
      case 2:
        return const Center(
          child: Text('Recherche Page'),
        );
      case 3:
        return const Center(
          child: Text('Profile Page'),
        );
      default:
        return const Center(
          child: Text('Page Inconnue'),
        );
    }
  }
}

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attractions'),
      ),
      body: _AttractionsContent(),
    );
  }
}

class _AttractionsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Vos boutons d'attractions ici
        ],
      ),
    );
  }
}

class LangueScreen extends StatelessWidget {
  const LangueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Langue'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, 'en'); // Changer la langue en anglais
              },
              child: const Text('English'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, 'fr'); // Changer la langue en français
              },
              child: const Text('Français'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);

    // Mettez à jour la locale de l'application
    _updateLocale(context, languageCode);
  }

  void _updateLocale(BuildContext context, String languageCode) {
    Locale newLocale = Locale(languageCode);
    initializeDateFormatting(newLocale.toString()).then((_) {
      // Force la reconstruction de l'interface utilisateur avec la nouvelle locale
      runApp(MyAppWrapper(initialLanguageCode: languageCode));
    });
  }
}

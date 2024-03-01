import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            icon: Icon(Icons.chat),
            label: 'Chat',
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
        return const Center(
          child: Text('Langue Page'),
        );
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
              context,
              'Casela Park',
              'assets/casela_park.jpg',
              const AttractionDetailsScreen('Casela Park',
                  'Contenu des détails de l\'attraction Casela Park ici')),
          customButton(
              context,
              'Casela Nepalese Bridge',
              'assets/Casela_nepalese_bridge.jpg',
              const AttractionDetailsScreen('Casela Nepalese Bridge',
                  'Contenu des détails de l\'attraction Casela Nepalese Bridge ici')),
          customButton(
              context,
              'Baie du Cap',
              'assets/Baie_du_cap.jpg',
              const AttractionDetailsScreen('Baie du Cap',
                  'Contenu des détails de l\'attraction Baie du Cap ici')),
          customButton(
              context,
              'Caudan Water Front',
              'assets/caudan.jpg',
              const AttractionDetailsScreen('Caudan Water Front',
                  'Contenu des détails de l\'attraction Caudan Water Front ici')),
          customButton(
              context,
              'Curious corner Museum',
              'assets/curious_corner.jpg',
              const AttractionDetailsScreen('Curious corner Museum',
                  'Contenu des détails de l\'attraction Curious corner Museum ici')),
          customButton(
              context,
              'Photography Museum',
              'assets/Photography_museum.jpg',
              const AttractionDetailsScreen('Photography Museum',
                  'Contenu des détails de l\'attraction Photography Museum ici')),
        ],
      ),
    );
  }

  Widget customButton(
      BuildContext context, String text, String imagePath, Widget screen) {
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
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 200,
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttractionDetailsScreen extends StatelessWidget {
  final String title;
  final String content;

  const AttractionDetailsScreen(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de l\'attraction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

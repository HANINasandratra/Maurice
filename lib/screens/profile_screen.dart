import 'package:flutter/material.dart';
import 'package:tour_maurice/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            // Placeholder pour la photo de profil
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Nasandratra Hany',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 222, 99, 148), // Couleur du bouton
              ),
              child: const Text(
                'Se déconnecter',
                style: TextStyle(
                    color:
                        Color.fromARGB(255, 240, 237, 237)), // Couleur du texte
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tour_maurice/main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Se connecter'),
      ),
      body: SingleChildScrollView(
        // Utilise SingleChildScrollView pour éviter le débordement
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo-tours_Trans.png', // Chemin vers le logo de votre application
                width: 150,
                height: 150,
                // Ajustez la largeur et la hauteur selon vos besoins
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                child: const Text('Se connecter'),
              ),
              TextButton(
                onPressed: () {
                  // Ajoutez ici la logique pour réinitialiser le mot de passe
                  print('Mot de passe oublié');
                },
                child: const Text('Mot de passe oublié ?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Vérifie si les identifiants sont corrects
    if (email == 'nasandratrahany@gmail.com' && password == '123456') {
      // Si les identifiants sont corrects, naviguer vers l'application principale (MyApp)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } else {
      // Afficher un message d'erreur si les identifiants sont incorrects
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erreur de connexion'),
            content: const Text('Identifiants incorrects.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

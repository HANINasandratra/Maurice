import 'package:flutter/material.dart';

class PlagesScreen extends StatelessWidget {
  const PlagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plages'),
      ),
      body: _PlagesContent(),
    );
  }
}

class _PlagesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
            context,
            'Belle Mare Beach',
            'assets/Belle_mare.jpg',
            const PlageDetailsScreen(
                'Belle Mare', 'Contenu des détails de la plage belle mare ici'),
          ),
          customButton(
            context,
            'Blue Bay beach',
            'assets/blue_bay.jpg',
            const PlageDetailsScreen('Blue Bay beach',
                'Contenu des détails de la plage Blue Bay beach ici'),
          ),
          customButton(
            context,
            'Flic en Flac',
            'assets/Flic_en_flac.jpg',
            const PlageDetailsScreen('Flic en Flac',
                'Contenu des détails de la plage Flic en Flac beach ici'),
          ),
          customButton(
            context,
            'Grand Bay beach',
            'assets/grand_baie.jpg',
            const PlageDetailsScreen('Grand Bay beach',
                'Contenu des détails de la plage Grand Bay beach ici'),
          ),
          customButton(
            context,
            'Iles aux cerfs',
            'assets/iles_aux_cerfs.jpg',
            const PlageDetailsScreen('Iles aux cerfs',
                'Contenu des détails de la plage Iles aux cerfs ici'),
          ),
          customButton(
            context,
            'Mont Choisy beach',
            'assets/Mont_choisy.jpg',
            const PlageDetailsScreen('Mont Choisy beach',
                'Contenu des détails de la Mont Choisy beach ici'),
          ),
          customButton(
            context,
            'Plage de la cuvette',
            'assets/plage_de_la_cuvette.jpg',
            const PlageDetailsScreen('Plage de la cuvette',
                'Contenu des détails de la Plage de la cuvette ici'),
          ),
          customButton(
            context,
            'Plage Morne',
            'assets/plage_morne.jpg',
            const PlageDetailsScreen(
                'Plage Morne', 'Contenu des détails de la Plage Morne ici'),
          ),
          customButton(
            context,
            'Poste la faillette Plage',
            'assets/poste_la_faillette.jpg',
            const PlageDetailsScreen('Poste la faillette Plage',
                'Contenu des détails de la Poste la faillette Plage ici'),
          ),
        ],
      ),
    );
  }

  Widget customButton(
    BuildContext context,
    String text,
    String imagePath,
    Widget screen,
  ) {
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

class PlageDetailsScreen extends StatelessWidget {
  final String title;
  final String content;

  const PlageDetailsScreen(this.title, this.content, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la plage'),
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

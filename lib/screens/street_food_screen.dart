import 'package:flutter/material.dart';

class StreetFoodScreen extends StatelessWidget {
  const StreetFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street Food'),
      ),
      body: _StreetFoodContent(),
    );
  }
}

class _StreetFoodContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
            context,
            'Briani',
            'assets/briani.jpg',
            const StreetFoodDetailsScreen(
                'Briani', 'Contenu des détails du plat Briani ici'),
          ),
          customButton(
            context,
            'Boulette',
            'assets/Boulette.jpg',
            const StreetFoodDetailsScreen(
                'Boulette', 'Contenu des détails du plat Boulette ici'),
          ),
          customButton(
            context,
            'Dholl Puri',
            'assets/Dholl_puri.jpg',
            const StreetFoodDetailsScreen(
                'Dholl Puri', 'Contenu des détails du plat Dholl Puri ici'),
          ),
          customButton(
            context,
            'Gateau Piment',
            'assets/gateau_piment.jpg',
            const StreetFoodDetailsScreen('Gateau Piment',
                'Contenu des détails du plat Gateau Piment ici'),
          ),
          customButton(
            context,
            'Mine/Riz frit',
            'assets/mine.jpg',
            const StreetFoodDetailsScreen('Mine/Riz frit',
                'Contenu des détails du plat Mine/Riz frit ici'),
          ),
          customButton(
            context,
            'Roti/Farata',
            'assets/roti.jpg',
            const StreetFoodDetailsScreen(
                'Roti/Farata', 'Contenu des détails du plat Roti/Farata ici'),
          ),
          customButton(
            context,
            'Salade confit',
            'assets/salade_confit.jpg',
            const StreetFoodDetailsScreen('Salade confit',
                'Contenu des détails du plat Salade confit ici'),
          ),
          customButton(
            context,
            'Haleem',
            'assets/haleem.jpg',
            const StreetFoodDetailsScreen(
                'Haleem', 'Contenu des détails du plat Haleem ici'),
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

class StreetFoodDetailsScreen extends StatelessWidget {
  final String title;
  final String content;

  const StreetFoodDetailsScreen(this.title, this.content, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la street food'),
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

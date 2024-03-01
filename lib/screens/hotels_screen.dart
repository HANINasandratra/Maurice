import 'package:flutter/material.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hôtels'),
      ),
      body: _HotelsContent(),
    );
  }
}

class _HotelsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
            context,
            'Four seasons hotel',
            'assets/4_season_hotel.jpg',
            const HotelDetailsScreen('Four seasons hotel',
                'Contenu des détails de Four seasons hotel ici'),
          ),
          customButton(
            context,
            'Constance Le Prince Hotel',
            'assets/Constance_le_prince.jpg',
            const HotelDetailsScreen('Constance Le Prince Hotel',
                'Contenu des détails de Constance Le Prince Hotel ici'),
          ),
          customButton(
            context,
            'Royal Palm Hotel',
            'assets/RoyalPalm_hotel.jpg',
            const HotelDetailsScreen('Royal Palm Hotel',
                'Contenu des détails de Royal Palm Hotel ici'),
          ),
          customButton(
            context,
            'Shangri-La' 's Le Touessork Resort And Spa',
            'assets/Shangri_la.jpg',
            const HotelDetailsScreen(
                'Shangri-La' 's Le Touessork Resort And Spa',
                'Contenu des détails de Shangri-La'
                    's Le Touessork Resort And Spa ici'),
          ),
          customButton(
            context,
            'St Regis Mauritius Resort',
            'assets/St_regis.jpg',
            const HotelDetailsScreen('St Regis Mauritius Resort',
                'Contenu des détails de St Regis Mauritius Resort ici'),
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

class HotelDetailsScreen extends StatelessWidget {
  final String title;
  final String content;

  const HotelDetailsScreen(this.title, this.content, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de l\'hôtel'),
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

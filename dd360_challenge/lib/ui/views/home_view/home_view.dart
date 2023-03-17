import 'package:flutter/material.dart';

import 'widgets/list_heros_marvel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DD360 Challenge'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const ListHerosMarvel(),
    );
  }
}

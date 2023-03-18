import 'package:flutter/material.dart';

class ErroImage extends StatelessWidget {
  const ErroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        size: 30,
      ),
    );
  }
}

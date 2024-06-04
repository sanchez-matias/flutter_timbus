import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String? description;
  final String? title;
  final String? imageUrl;

  const Slide({
    super.key,
    this.description,
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title != null
                ? Text(title!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))
                : const SizedBox(),
            const SizedBox(height: 30),
            imageUrl != null
                ? Center(child: Image(image: AssetImage(imageUrl!)))
                : const SizedBox(),
            description != null
                ? Text(
                    description!,
                    style: const TextStyle(fontSize: 18),
                  )
                : const SizedBox(),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

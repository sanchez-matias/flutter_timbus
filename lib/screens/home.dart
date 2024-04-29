import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TIMBUS', style: TextStyle(fontSize: 30)),
            _GameOptionButton(
              title: 'La Mosca',
              icon: Icons.emoji_nature,
              routeName: 'mosca',
            ),
            _GameOptionButton(
              title: 'Truco',
              icon: Icons.crop_square,
              routeName: 'truco',
            ),
            _GameOptionButton(
              title: 'Generala',
              icon: Icons.casino,
              routeName: 'generala',
            ),
          ],
        ),
      ),
    ));
  }
}

class _GameOptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const _GameOptionButton({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
          shape: const StadiumBorder(),
          onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            if (!context.mounted) return;
            Navigator.of(context).pushNamed(routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          )),
    );
  }
}

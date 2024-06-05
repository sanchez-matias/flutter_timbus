import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
          bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            SizedBox(
              width: size.width * 0.6,
              child: const Stack(
                children: [
                  Center(
                    child: Text('Timbus',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 28, 40),
                          fontSize: 80,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.w800,
                        )),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image(
                      width: 40,
                      height: 40,
                      image: AssetImage('assets/images/dices.png'),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image(
                      width: 40,
                      height: 40,
                      image: AssetImage('assets/images/cards.png'),
                    ),
                  ),

                ],
              ),
            ),
            
            const SizedBox(height: 50),

            const _GameOptionButton(
              title: 'La Mosca',
              icon: Icons.emoji_nature,
              routeName: 'mosca',
            ),
            
            const _GameOptionButton(
              title: 'Truco',
              icon: Icons.crop_square,
              routeName: 'truco',
            ),

            const _GameOptionButton(
              title: 'Generala',
              icon: Icons.casino,
              routeName: 'generala',
            ),
            const _GameOptionButton(
              title: 'Chinchón',
              icon: Icons.healing_outlined,
              routeName: 'chinchon',
            ),
            const _GameOptionButton(
              title: 'Ver Reglas',
              icon: Icons.rule,
              routeName: 'rules',
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

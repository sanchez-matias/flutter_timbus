import 'package:flutter/material.dart';

const screens = [
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
  _GameOptionButton(
    title: 'Chinchón',
    icon: Icons.healing_outlined,
    routeName: 'chinchon',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //* App Bar
          SliverAppBar(
            pinned: true,
            expandedHeight: size.height * 0.3,
            flexibleSpace: const FlexibleSpaceBar(
              background: SizedBox.expand(
                child: Column(
                  children: [
                    SafeArea(
                      child: Text(
                        'Timbus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontFamily: 'DancingScript',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _CustomHeaderButton(
                          title: 'Ajustes',
                          icon: Icons.settings,
                          routeName: 'settings',
                        ),

                        SizedBox(width: 50),

                        _CustomHeaderButton(
                          title: 'Reglas',
                          icon: Icons.list_alt,
                          routeName: 'rules',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //* Body
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: size.height * 0.2,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: screens.length,
              (context, index) => screens[index],
            ),
          ),
        ],
      ),
    );
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
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black
            )
          ),
          clipBehavior: Clip.antiAlias,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomHeaderButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const _CustomHeaderButton({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.12,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: size.height * 0.035),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
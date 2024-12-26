import 'package:flutter/material.dart';

class _RulesPageItem {
  final String title;
  final IconData iconData;
  final String route;

  _RulesPageItem({
    required this.title,
    required this.iconData,
    required this.route,
  });
}

final _items = <_RulesPageItem>[
  _RulesPageItem(
    title: 'La Mosca',
    iconData: Icons.emoji_nature,
    route: 'mosca_rules',
  ),
  _RulesPageItem(
    title: 'Truco',
    iconData: Icons.crop_square,
    route: 'truco_rules',
  ),
  _RulesPageItem(
    title: 'Generala',
    iconData: Icons.casino,
    route: 'generala_rules',
  ),
  _RulesPageItem(
    title: 'Chinchon',
    iconData: Icons.healing,
    route: 'chinchon_rules',
  ),
];

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text('Reglas de Juegos'),
        ),
        body: Center(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = _items[index];
          
              return Container(
                child: MaterialButton(
                  padding: const EdgeInsets.all(15),
                  shape: const StadiumBorder(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.iconData),
                      const SizedBox(width: 20),
                      Text(
                        item.title,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, item.route);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: _items.length,
          ),
        ));
  }
}

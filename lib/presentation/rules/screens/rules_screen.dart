import 'package:flutter/material.dart';

import 'package:flutter_timbus_annotations/presentation/rules/slides/slides.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';
import 'package:flutter_timbus_annotations/presentation/rules/screens/rules_slideshow.dart';

class RulesScreen extends StatefulWidget {
  final String? gameName;

  const RulesScreen({super.key, this.gameName});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  final slides = <Slideshow>[
    chinchonSlides,
    generalaSlides,
    trucoSlides,
    moscaSlides,
  ];

  @override
  void initState() {
    super.initState();

    final selectedSlides = slides.where((element) => element.name == widget.gameName).toList();
    if (selectedSlides.isEmpty) return;

    // We must wait until the widget tree is already built to auto-push the Slideshow
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        _createRoute(RulesSlideshow(slideshow: selectedSlides.first)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reglas de Juegos'),
      ),
      body: ListView.builder(
        itemCount: slides.length,
        itemBuilder: (context, index) {
          final slide = slides[index];

          return _ListViewItem(slide);
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  final Slideshow slideshow;

  const _ListViewItem(this.slideshow);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            _createRoute(RulesSlideshow(slideshow: slideshow)),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: colors.primary),
                ),
              ),

              Positioned(
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Expanded(
                    child: Text(
                        slideshow.name,
                        style: TextStyle(
                          fontSize: 30,
                          color: colors.primary
                        ),
                      ),
                  ),
                ),
              ),
          
              Positioned(
                right: -20,
                child: Icon(
                  slideshow.icon,
                  color: colors.primary,
                  size: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route<Widget> _createRoute(Widget child) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.linear );

        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero ).animate(curvedAnimation),
          child: child,
        );
      },
    );

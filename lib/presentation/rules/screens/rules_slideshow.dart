import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_timbus_annotations/presentation/rules/cubit/slides_page_cubit.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';
import 'package:flutter_timbus_annotations/presentation/rules/widgets/slideshow_dots.dart';

class RulesSlideshow extends StatelessWidget {
  final Slideshow slideshow;

  const RulesSlideshow({super.key, required this.slideshow});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.primary,
      ),
      body: BlocProvider(
        create: (context) => SlidesPageCubit(),
        child: Stack(
          children: [
            Expanded(child: _Slides(slideshow.name, slideshow.slides)),
            
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: SlideshowDots(slidesCount: slideshow.slides.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final String name;
  final List<Widget> slides;

  const _Slides(this.name, this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(
      () {
        context.read<SlidesPageCubit>().changeValue(controller.page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        _TitlePage(widget.name),
        
        ...List.generate(
          widget.slides.length,
          (index) => _SlidePage(widget: widget.slides[index]),
        ),
      ],
    );
  }
}

class _SlidePage extends StatelessWidget {
  const _SlidePage({
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            widget,
        
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class _TitlePage extends StatelessWidget {
  final String title;

  const _TitlePage(this.title);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Positioned(
          left: 10,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          left: 28,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 80,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 30,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 80,
            ),
          ),
        ),
      ],
    );
  }
}

// class _TitleShapePainter extends CustomPainter {
//   final Color painterColor;

//   _TitleShapePainter(this.painterColor);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = painterColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 2;

//     final path = Path();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

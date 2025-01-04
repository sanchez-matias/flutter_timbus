import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_timbus_annotations/presentation/rules/cubit/slides_page_cubit.dart';

class SlideshowDots extends StatelessWidget {
  final int slidesCount;

  const SlideshowDots({
    super.key,
    required this.slidesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            slidesCount + 1,
            (index) => _Dot(index),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<SlidesPageCubit>().state;
    final colors = Theme.of(context).colorScheme;

    return AnimatedContainer(
      height: 10,
      width: 10,
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (currentPage >= index - 0.5 && currentPage < index + 0.5)
            ? colors.primary
            : Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

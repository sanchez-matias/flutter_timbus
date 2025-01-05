import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/rules/screens/rules_screen.dart';
import 'package:flutter_timbus_annotations/presentation/truco/bloc/truco_cubit.dart';
import 'package:flutter_timbus_annotations/presentation/shared/helpers/helpers.dart';
import 'package:flutter_timbus_annotations/presentation/truco/widgets/widgets.dart';

class TrucoScreen extends StatelessWidget {
  const TrucoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = MenuController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Truco'),
        actions: [
          _GameOptionsMenu(
            controller: menuController,
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => menuController.open(),
            ),
          ),
        ],
      ),
      body: BlocBuilder<TrucoCubit, TrucoState>(
        builder: (context, state) {
          return Row(
            children: [
              _PlayerColumn(name: 'Nosotros', score: state.scores[0], scoreLimit: state.scoreLimit,),

              _PlayerColumn(name: 'Ellos', score: state.scores[1], scoreLimit: state.scoreLimit,)
            ],
          );
        },
      ),
      bottomNavigationBar: const _CustomBottomAppBar(),
    );
  }
}

class _PlayerColumn extends StatelessWidget {
  final int score; 
  final String name;
  final int scoreLimit;

  const _PlayerColumn({required this.name, required this.score, required this.scoreLimit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width * 0.12;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: size * 1.3,
              width: size * 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all()
              ),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            
                  Text(score.toString(), style: const TextStyle(fontSize: 20, color: Colors.red),)
                ],
              ),
            ),
          ),

          ...List.generate(3, (index) {
            final counter = index + 1;

            if (scoreLimit % 5 == 0) {
              return TrucoSquareDrawer(size: size, globalScore: score, relativeMaxScore: counter * 5);
            }

              return TrucoTriangleDrawer(
                  size: size, globalScore: score, relativeMaxScore: counter * 3);
            },
          ),
          
          if (scoreLimit > 15 && score > scoreLimit / 2)
            const Divider(),

          if (scoreLimit > 15)
            ...List.generate(3, (index) {
              final counter = index + 4;

              if (scoreLimit % 5 == 0) {
                return TrucoSquareDrawer(size: size, globalScore: score, relativeMaxScore: counter * 5);
              }

                return TrucoTriangleDrawer(
                    size: size, globalScore: score, relativeMaxScore: counter * 3);
              },
            ),
        ],
      ),
    );
  }
}

class _CustomBottomAppBar extends StatelessWidget {
  const _CustomBottomAppBar();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BottomAppBar(
        height: size.height * 0.08,
        child: Row(
          children: [
            _UpAndDownButtons(context.read<TrucoCubit>().addPointToUs),
            _UpAndDownButtons(context.read<TrucoCubit>().addPointToThem),
          ],
        ),
      );
  }
}

class _UpAndDownButtons extends StatelessWidget {
  final void Function(int) callback;

  const _UpAndDownButtons(this.callback);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              callback(1);
            },
            color: Colors.white,
            icon: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(width: 25),
          IconButton(
            onPressed: () {
              callback(-1);
            },
            icon: const Icon(Icons.arrow_downward),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _GameOptionsMenu extends StatelessWidget {
  final Widget child;
  final MenuController controller;

  const _GameOptionsMenu({required this.child, required this.controller});

  @override
  Widget build(BuildContext context) {
    final trucoCubit = context.watch<TrucoCubit>();

    return MenuAnchor(
      controller: controller,
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.list_alt),
          child: const Text('Ver reglas del juego'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RulesScreen(
                    gameName: 'Truco',
                  ),
                ));
          },
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.onetwothree),
          child: const Text('Cambiar límite'),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const _ScoreLimitChanger(),
          ),
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.change_circle_outlined),
          onPressed: trucoCubit.state.isMatchClear
            ? null
              : () => showDialog(
                    context: context,
                    builder: (context) => AreYouSureDialog(
                        callback: context.read<TrucoCubit>().resetGame),
                  ),
          child: const Text('Volver a empezar'),
        ),
      ],
      child: child,
    );
  }
}

class _ScoreLimitChanger extends StatelessWidget {
  const _ScoreLimitChanger();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final chinchonBloc = context.watch<TrucoCubit>();
    final scoreLimit = chinchonBloc.state.scoreLimit;

    return AlertDialog(
      title: const Text('Nuevo límite de puntos'),
      content: SizedBox(
        height: size.height * 0.3,
        child: Column(
          children: [
            RadioListTile.adaptive(
                value: 9,
                title: const Text('9'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<TrucoCubit>().changeScoreLimit(value);
                },
              ),

              RadioListTile.adaptive(
                value: 15,
                title: const Text('15'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<TrucoCubit>().changeScoreLimit(value);
                },
              ),

              RadioListTile.adaptive(
                value: 18,
                title: const Text('18'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<TrucoCubit>().changeScoreLimit(value);
                },
              ),

              RadioListTile.adaptive(
                value: 30,
                title: const Text('30'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<TrucoCubit>().changeScoreLimit(value);
                },
              ),
          ],
        ),
      ),
    );
  }
}
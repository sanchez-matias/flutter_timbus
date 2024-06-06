import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/presentation/helpers/dialogs.dart';
import 'package:flutter_timbus_annotations/presentation/widgets/truco_square_drawer.dart';

class TrucoScreen extends StatelessWidget {
  const TrucoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final trucoCubit = BlocProvider.of<TrucoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text('Truco'),
        actions: [
          IconButton(
            tooltip: 'Eliminar Jugada',
            onPressed: () async {
              final areYouSure = await showAreYouSureDialog(context);
              if (!areYouSure) return;

              trucoCubit.resetGame();
            },
            icon: const Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: trucoCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                // Us Column
                _buildPlayerColumn(
                    title: 'Nosotros', score: trucoCubit.state[0]),

                const VerticalDivider(),

                // Them Column
                _buildPlayerColumn(title: 'Ellos', score: trucoCubit.state[1]),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.08,
        child: Row(
          children: [
            _UpAndDownButtons(trucoCubit.addPointToUs),
            _UpAndDownButtons(trucoCubit.addPointToThem),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerColumn({
    required String title,
    required int score,
  }) {
    const size = 60.0;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          const Divider(),
          const Spacer(),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 5,
          ),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 10,
          ),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 15,
          ),
          const Divider(),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 20,
          ),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 25,
          ),
          TrucoSquareDrawer(
            size: size,
            globalScore: score,
            relativeMaxScore: 30,
          ),
          const Spacer(),
          const Divider(),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 25,
              color: score >= 25 ? Colors.red : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/presentation/helpers/helpers.dart';

class GeneralaScreen extends StatelessWidget {
  const GeneralaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MenuController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          actions: [
            _GameOptionsMenu(controller: controller,
              child: IconButton(
                onPressed: () {
                  controller.open();
                },
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ),
          ],
          title: const Text('Generala'),
        ),
        body: BlocBuilder<GeneralaCubit, GeneralaState>(
          builder: (context, state) {
            return state.players.isEmpty
                ? const _GeneralaPlayerLoader()
                : _PlayersScores(state.players);
          },
        ));
  }
}

class _PlayersScores extends StatelessWidget {
  final List<GeneralaPlayer> players;

  const _PlayersScores(this.players);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final names = players.map((player) => player.name).toList();
    final globalScores = players.map((player) => player.globalScore).toList();

    const scoreNameRow = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      'ESCALERA',
      'FULL',
      'POKER',
      'GENERALA',
      'DOBLE',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Table(
          columnWidths: {0: FixedColumnWidth(size.width * 0.25)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            // Names Row
            TableRow(
              children: [
                const SizedBox(),
                ...List.generate(
                    players.length,
                    (index) => Text(
                          names[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
              ],
            ),
        
            // Scores Rows
            ...List.generate(
              11,
              (rowIndex) => TableRow(children: [
                Text(
                  scoreNameRow[rowIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17),
                ),
                ...List.generate(
                    players.length,
                    (columnIndex) => TableCell(
                          selectedPlayer: players[columnIndex],
                          selectedRow: rowIndex,
                        )),
              ]),
            ),
          ],
        ),

        const SizedBox(height: 15),

        // Global Scores Row
        Row(
          children: [
            SizedBox(width: size.width * 0.25),
            ...List.generate(
              players.length,
              (index) => Expanded(
                child: Center(
                  child: Text(
                    '${globalScores[index]}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TableCell extends StatelessWidget {
  final GeneralaPlayer selectedPlayer;
  final int selectedRow;

  const TableCell({
    super.key,
    required this.selectedPlayer,
    required this.selectedRow,
  });

  int getNonNumericScoreValue(int value) {
    return 20;
  }

  @override
  Widget build(BuildContext context) {
    final selectedCell = selectedPlayer.scoresMap.values.toList()[selectedRow];

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: selectedCell.isCrossedOut
              ? Colors.red
              : selectedCell.score == 0
                  ? Colors.grey
                  : Colors.green,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              if (selectedCell.isNumeric) {
                return _NumericOptionsDialog(
                  player: selectedPlayer,
                  cell: selectedCell,
                );
              } else {
                return _NonNumericOptionsDialog(
                  player: selectedPlayer,
                  cell: selectedCell,
                );
              }
            },
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              selectedCell.isCrossedOut
                  ? 'X'
                  : '${selectedPlayer.scoresList[selectedRow]}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

class _NumericOptionsDialog extends StatelessWidget {
  final GeneralaPlayer player;
  final GeneralaCell cell;

  const _NumericOptionsDialog({required this.player, required this.cell});

  void changeScoreValue({
    required BuildContext context,
    required int selectedOption,
    required bool isCrossedOut,
  }) {
    context.read<GeneralaCubit>().changeCellValue(
          player: player,
          newValue: GeneralaCell(
            rowValue: cell.rowValue,
            isCrossedOut: isCrossedOut,
            selectedOption: selectedOption,
          ),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    const style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return AlertDialog(
      content: SizedBox(
        height: size.height * 0.45,
        width: double.minPositive,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              // Cross Out option
              if (index == 6) {
                return RadioListTile(
                  title: const Text('X - Tachar', style: style),
                  value: 6,
                  groupValue: cell.selectedOption,
                  onChanged: (value) => changeScoreValue(context: context, isCrossedOut: true, selectedOption: 6),
                );
              }
                
              // Numeric options
              return RadioListTile(
                title: Text('${cell.rowValue * index}', style: style),
                value: index,
                groupValue: cell.selectedOption,
                onChanged: (value) => changeScoreValue(context: context, isCrossedOut: false, selectedOption: index)
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NonNumericOptionsDialog extends StatelessWidget {
  final GeneralaPlayer player;
  final GeneralaCell cell;

  const _NonNumericOptionsDialog({required this.player, required this.cell});

  void changeScoreValue({
    required BuildContext context,
    required int selectedOption,
    required bool isCrossedOut,
  }) {
    context.read<GeneralaCubit>().changeCellValue(
          player: player,
          newValue: GeneralaCell(
            rowValue: cell.rowValue,
            isCrossedOut: isCrossedOut,
            selectedOption: selectedOption,
          ),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    const style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return AlertDialog(
      content: SizedBox(
        height: size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RadioListTile(
              title:  const Text('0', style: style),
              value: 0,
              groupValue: cell.selectedOption,
              onChanged: (value) => changeScoreValue(context: context, isCrossedOut: false, selectedOption: 0),
            ),
      
            RadioListTile(
              title: Text('${cell.rowValue}  -  Armada', style: style),
              value: 1,
              groupValue: cell.selectedOption,
              onChanged: (value) => changeScoreValue(context: context, isCrossedOut: false, selectedOption: 1),
            ),
      
            RadioListTile(
              title: Text('${cell.rowValue + 5}  -  Servida', style: style),
              value: 2,
              groupValue: cell.selectedOption,
              onChanged: (value) => changeScoreValue(context: context, isCrossedOut: false, selectedOption: 2),
            ),
      
            RadioListTile(
              title: const Text('X  -  Tachar', style: style),
              value: 3,
              groupValue: cell.selectedOption,
              onChanged: (value) => changeScoreValue(context: context, isCrossedOut: true, selectedOption: 3),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameOptionsMenu extends StatelessWidget {
  final Widget child;
  final MenuController controller;

  const _GameOptionsMenu({
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final generalaBloc = context.watch<GeneralaCubit>();
    final isStateEmpty = generalaBloc.state.players.isEmpty;
    final isDirty = generalaBloc.state.isTableDirty;

    return MenuAnchor(
      controller: controller,
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.list_alt),
          child: const Text('Ver reglas del juego'),
          onPressed: () {
            Navigator.pushNamed(context, 'generala_rules');
          },
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.change_circle_outlined),
          onPressed: isStateEmpty || isDirty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => AreYouSureDialog(
                    callback: context.read<GeneralaCubit>().resetMatch,
                  ),
                ),
          child: const Text('Volver a Empezar'),
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.delete),
          onPressed: isStateEmpty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => AreYouSureDialog(
                    callback: context.read<GeneralaCubit>().deleteMatch,
                  ),
                ),
          child: const Text('Descartar partida'),
        ),
      ],
      child: child,
    );
  }
}

class _GeneralaPlayerLoader extends StatefulWidget {
  const _GeneralaPlayerLoader();

  @override
  State<_GeneralaPlayerLoader> createState() => _GeneralaPlayerLoaderState();
}

class _GeneralaPlayerLoaderState extends State<_GeneralaPlayerLoader> {
  final _controller = TextEditingController();
  final List<String> _namesList = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [       
        const Text(
          'Ingrese el nombre de cada jugador',
          style: TextStyle(fontSize: 20),
        ),
    
        const SizedBox(height: 30),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  controller: _controller,
                  autocorrect: false,
                ),
              ),
    
              const SizedBox(width: 20),
    
              IconButton.filled(
                color: Colors.white,
                onPressed: () {
                  if (_controller.text.isEmpty || _controller.text == '') return;
                  _namesList.add(_controller.text.toUpperCase());
                  _controller.text = '';
                  setState(() {});
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
    
        const SizedBox(height: 20),
    
        SingleChildScrollView(
          child: Wrap(
            children: List<Widget>.generate(
              _namesList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Chip(
                  backgroundColor: Colors.blue.shade100,
                  label: Text(_namesList[index]),
                  onDeleted: () {
                    _namesList.removeAt(index);
                    setState(() {});
                  },
                  deleteIcon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 30),
    
        FilledButton(
          onPressed: _namesList.isEmpty || _namesList.length == 1
              ? null
              : () {
                  if (_namesList.isEmpty) return;
                  context.read<GeneralaCubit>().addPlayers(_namesList);
                },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              'COMENZAR',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),

        SizedBox(height: size.height * 0.2)
      ],
    );
  }
}
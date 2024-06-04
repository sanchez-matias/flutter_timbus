class GeneralaCell {
  final int value;
  final bool isCrossedOut;

  const GeneralaCell({
    this.value = 0,
    this.isCrossedOut = false,
  });
}

class GeneralaPlayer {
  final String name;
  final GeneralaCell oneRow;
  final GeneralaCell twoRow;
  final GeneralaCell threeRow;
  final GeneralaCell fourRow;
  final GeneralaCell fiveRow;
  final GeneralaCell sixRow;
  final GeneralaCell straight;
  final GeneralaCell full;
  final GeneralaCell poker;
  final GeneralaCell generala;
  final GeneralaCell double;

  GeneralaPlayer({
    this.name = 'player',
    this.oneRow = const GeneralaCell(),
    this.twoRow = const GeneralaCell(), 
    this.threeRow = const GeneralaCell(), 
    this.fourRow = const GeneralaCell(), 
    this.fiveRow = const GeneralaCell(), 
    this.sixRow = const GeneralaCell(), 
    this.straight = const GeneralaCell(), 
    this.full = const GeneralaCell(), 
    this.poker = const GeneralaCell(), 
    this.generala = const GeneralaCell(), 
    this.double = const GeneralaCell(), 
  });

  int get globalScore =>
      oneRow.value +
      twoRow.value +
      threeRow.value +
      fourRow.value +
      fiveRow.value +
      sixRow.value +
      straight.value +
      full.value +
      poker.value +
      generala.value +
      double.value;

  Map<String, GeneralaCell> get scoresMap => {
        '1': oneRow,
        '2': twoRow,
        '3': threeRow,
        '4': fourRow,
        '5': fiveRow,
        '6': sixRow,
        'straight': straight,
        'full': full,
        'generala': generala,
        'double': double,
      };

  List<int> get scoresList => scoresMap.values.map((cell) => cell.value).toList();

  bool isCellCrossedOut(int rowIndex) {
    final paramsList = scoresMap.values.toList();
    return paramsList[rowIndex].isCrossedOut;
  } 

  GeneralaPlayer copyWith({
    required Map<String, GeneralaCell> newScores,
    List<int>? crossedOutCells,
  }) =>
      GeneralaPlayer(
        name: name,
        oneRow: newScores['1'] ?? oneRow,
        twoRow: newScores['2'] ?? twoRow,
        threeRow: newScores['3'] ?? threeRow,
        fourRow: newScores['4'] ?? fourRow,
        fiveRow: newScores['5'] ?? fiveRow,
        sixRow: newScores['6'] ?? sixRow,
        straight: newScores['straight'] ?? straight,
        full: newScores['full'] ?? full,
        poker: newScores['poker'] ?? poker,
        generala: newScores['generala'] ?? generala,
        double: newScores['double'] ?? double,
      );
}

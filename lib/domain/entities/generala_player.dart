class GeneralaPlayer {
  final String name;
  final List<int> crossedOutCells;
  final int oneRow;
  final int twoRow;
  final int threeRow;
  final int fourRow;
  final int fiveRow;
  final int sixRow;
  final int straight;
  final int full;
  final int poker;
  final int generala;
  final int double;

  GeneralaPlayer({
    this.name = 'player',
    this.crossedOutCells = const [],
    this.oneRow = 0,
    this.twoRow = 0,
    this.threeRow = 0,
    this.fourRow = 0,
    this.fiveRow = 0,
    this.sixRow = 0,
    this.straight = 0,
    this.full = 0,
    this.poker = 0,
    this.generala = 0,
    this.double = 0,
  });

  int get globalScore =>
      oneRow +
      twoRow +
      threeRow +
      fourRow +
      fiveRow +
      sixRow +
      straight +
      full +
      poker +
      generala +
      double;

  Map<String, int> get scoresMap => {
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

  List<int> get scoresList => scoresMap.values.toList();

  bool isCellCrossedOut(int rowIndex) => scoresList.any((element) => element == rowIndex);

  GeneralaPlayer copyWith({
     required Map<String, int> newScores,
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
        crossedOutCells: crossedOutCells ?? this.crossedOutCells,
      );
}

import 'package:isar/isar.dart';

part 'generala_player.g.dart';

@embedded
class GeneralaCell {
  final int rowValue;
  final int selectedOption;
  final bool isCrossedOut;

  const GeneralaCell({
    this.rowValue = 0,
    this.selectedOption = 0,
    this.isCrossedOut = false,
  });

  @ignore
  bool get isNumeric => rowValue < 20;

  @ignore
  int get score {
    if (isCrossedOut) return 0;

    if (isNumeric) {
      return rowValue * selectedOption;
    } else if (selectedOption < 2){
      return rowValue * selectedOption;
    } else {
      return  rowValue + 5;
    }
  }
}

@collection
class GeneralaPlayer {
  Id id = Isar.autoIncrement;

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
    this.id = Isar.autoIncrement,
    this.name = 'player',
    this.oneRow = const GeneralaCell(rowValue: 1),
    this.twoRow = const GeneralaCell(rowValue: 2), 
    this.threeRow = const GeneralaCell(rowValue: 3), 
    this.fourRow = const GeneralaCell(rowValue: 4), 
    this.fiveRow = const GeneralaCell(rowValue: 5), 
    this.sixRow = const GeneralaCell(rowValue: 6), 
    this.straight = const GeneralaCell(rowValue: 20), 
    this.full = const GeneralaCell(rowValue: 30), 
    this.poker = const GeneralaCell(rowValue: 40), 
    this.generala = const GeneralaCell(rowValue: 50), 
    this.double = const GeneralaCell(rowValue: 100), 
  });

  @ignore
  int get globalScore =>
      oneRow.score +
      twoRow.score +
      threeRow.score +
      fourRow.score +
      fiveRow.score +
      sixRow.score +
      straight.score +
      full.score +
      poker.score +
      generala.score +
      double.score;

  @ignore
  Map<String, GeneralaCell> get scoresMap => {
        '1': oneRow,
        '2': twoRow,
        '3': threeRow,
        '4': fourRow,
        '5': fiveRow,
        '6': sixRow,
        'straight': straight,
        'full': full,
        'poker': poker,
        'generala': generala,
        'double': double,
      };

  @ignore
  List<int> get scoresList => scoresMap.values.map((cell) => cell.score).toList();

  GeneralaPlayer copyWith({
    required Map<String, GeneralaCell> newScores,
  }) =>
      GeneralaPlayer(
        id: id,
        name: name,
        oneRow: newScores['1'] ?? oneRow,
        twoRow: newScores['2'] ?? twoRow,
        threeRow: newScores['3'] ?? threeRow,
        fourRow: newScores['4'] ?? fourRow,
        fiveRow: newScores['5'] ?? fiveRow,
        sixRow: newScores['6'] ?? sixRow,
        straight: newScores['20'] ?? straight,
        full: newScores['30'] ?? full,
        poker: newScores['40'] ?? poker,
        generala: newScores['50'] ?? generala,
        double: newScores['100'] ?? double,
      );
}

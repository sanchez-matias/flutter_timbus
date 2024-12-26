import 'package:flutter/material.dart';

class ScoreColumn extends StatelessWidget {
  final String name;
  final int currentScore;
  final List<int> scoreHistory;
  final bool isPlayerEliminated;

  const ScoreColumn({
    super.key,
    required this.name,
    required this.currentScore,
    required this.scoreHistory,
    required this.isPlayerEliminated,
  });

  @override
  Widget build(BuildContext context) {
    final shortenedName = name.length > 4 ? name.substring(0, 4) : name;

    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.18,
        decoration: BoxDecoration(
          color: isPlayerEliminated
            ? Colors.grey
            : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all()
        ),
        child: Column(
          children: [
            RichText(text: 
              TextSpan(
                text: shortenedName,
                style:  TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 23,
                  decoration: isPlayerEliminated
                    ? TextDecoration.lineThrough
                    : null
                ),
              ),
            ),
        
            Text(
              currentScore.toString(),
              style: const TextStyle(
                fontSize: 23,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),
        
            ...List.generate(
              scoreHistory.length <= 20
                ? scoreHistory.length
                : 20,
              (historyIndex) => Text(scoreHistory[historyIndex].toString()),
            ),

            const Spacer(),

            IconButton(
              onPressed: () {
                // TODO: implement user editing
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:numbergenerator/model/numberlogic.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({super.key});

  @override
  State<NumberGenerator> createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  NumberLogic numlog = NumberLogic();
  List<int> num = [];
  int start = 0;
  int counter = 0;
  int score = 0;
  int ran1 = 0;
  int ran2 = 0;
  List<int> correct = [];
  List<int> incorrect = [];
  int clickremaining = 0;

  List<int> changenumlogic() {
    setState(() {
      num = numlog.generateNumber();
    });
    return num;
  }

  Widget result = Column();
  Widget conditionallogic() {
    setState(
      () {
        result = Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Correct:  ${correct[correct.length - 1].toString()}'),
            const SizedBox(height: 40),
            Text("Incorrect: ${incorrect[incorrect.length - 1].toString()}"),
            const SizedBox(height: 40),
            Text("Total Score: $score"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                counter = 0;
                changenumlogic();
              },
              child: const Text("Restart Game "),
            ),
          ],
        );
      },
    );
    return result;
  }

  int check(numberr) {
    if (numberr == ran2 && numberr > ran1) {
      correct.add(ran2);
      score++;
      incorrect.add(ran1);
    } else if (numberr == ran1 && numberr > ran2) {
      correct.add(ran1);
      score++;
      incorrect.add(ran2);
    } else if (numberr == ran2) {
      correct.add(ran2);

      incorrect.add(ran1);
    } else if (numberr == ran1) {
      correct.add(ran1);

      incorrect.add(ran2);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator'),
      ),
      body: Container(
        color: const Color(0xFFDCDCDC),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter += 1;
                    check(ran1);
                    var res = changenumlogic();
                    clickremaining = 10 - counter;
                    ran1 = res[0];
                    ran2 = res[1];
                  },
                  child: counter > 10
                      ? Text(start.toString())
                      : Text(ran1.toString()),
                ),
                ElevatedButton(
                  onPressed: () {
                    counter += 1;
                    check(ran2);
                    var res = changenumlogic();
                    clickremaining = 10 - counter;
                    ran1 = res[0];
                    ran2 = res[1];
                  },
                  child: counter > 10
                      ? Text(start.toString())
                      : Text(ran2.toString()),
                ),
              ],
            ),
            Container(
              child: counter > 10
                  ? conditionallogic()
                  : Text(
                      'Yeti thichna baki cha ($clickremaining)',
                      style: const TextStyle(color: Colors.black),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

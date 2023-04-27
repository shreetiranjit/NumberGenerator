import 'dart:math';

class NumberLogic {
  List<int> generateNumber() {
    List<int> num = [];
    Random random = Random();
    for (int i = 0; i < 2; i++) {
      int randomNumber = random.nextInt(100);
      if (!num.contains(randomNumber)) {
        num.add(randomNumber);
      } else {
        randomNumber = random.nextInt(100);
        num.add(randomNumber);
      }
    }
    return num;
  }
}

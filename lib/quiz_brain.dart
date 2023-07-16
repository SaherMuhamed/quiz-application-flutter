import 'question.dart';

class QuizBrain {

  late int _questionNumber = 0;

  // _questionBank means that this property is now private that's means any other classes can't access this property.

  final List<Questions> _questionBank = [
    Questions(questionText: 'Some cats are actually allergic to humans', questionAnswer: true),
    Questions(questionText: 'You can lead a cow down stairs but not up stairs.', questionAnswer: false),
    Questions(
        questionText: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Questions(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Questions(questionText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".', questionAnswer: true),
    Questions(questionText: 'It is illegal to pee in the Ocean in Portugal.', questionAnswer: true),
    Questions(
        questionText: 'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false),
    Questions(
        questionText: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questionAnswer: true),
    Questions(
        questionText: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false),
    Questions(
        questionText: 'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    Questions(questionText: 'Google was originally called "Backrub".', questionAnswer: true),
    Questions(
        questionText: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true),
    Questions(
        questionText: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // This methods is now acts as a getter and setter (Encapsulation in action).

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1){
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

}
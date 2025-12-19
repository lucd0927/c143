
abstract class TwBaseEvent{
  String name();
}


enum EnumQuizGfittt { index2, index8, scroll }

class QuizGifttttEvent extends TwBaseEvent {
  @override
  String name() {
    return "QuizGiftttt";
  }

  final EnumQuizGfittt type;

  QuizGifttttEvent({required this.type});
}


abstract class TwBaseEvent{
  String name();
}


enum EnumQuizGfittt { updateRight2, updateRight8, scroll }

class QuizGifttttEvent extends TwBaseEvent {
  @override
  String name() {
    return "QuizGiftttt";
  }

  final EnumQuizGfittt type;

  QuizGifttttEvent({required this.type});
}

enum Type { multiple, boolean }

enum Difficulty { easy, medium, hard }

class Question {
  late final String? categoryName;
  late final Type? type;
  late final Difficulty? difficulty;
  late final String? question;
  late final String? correctAnswer;
  late final List<dynamic>? incorrect_answers;

  Question(
      {this.categoryName,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrect_answers});

  Question.fromMap(Map<String, dynamic> data)
      : categoryName = data["categoria"],
        type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
        difficulty = data["difficulty"] == "easy"
            ? Difficulty.easy
            : data["difficulty"] == "medium"
            ? Difficulty.medium
            : Difficulty.hard,
        question = data["question"],
        correctAnswer = data["correct_answer"],
        incorrect_answers = data["incorrect_answers"];

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromMap(question)).toList();
  }

}

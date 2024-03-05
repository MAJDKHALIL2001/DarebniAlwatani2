// class QuestionModel {
//   String? questionText;
//   List<Answers>? answers;

//   QuestionModel({this.questionText, this.answers});

//   QuestionModel.fromJson(Map<String, dynamic> json) {
//     questionText = json['question_text'];
//     if (json['answers'] != null) {
//       answers = <Answers>[];
//       json['answers'].forEach((v) {
//         answers!.add(new Answers.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['question_text'] = this.questionText;
//     if (this.answers != null) {
//       data['answers'] = this.answers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Answers {
//   String? answerText;
//   int? status;

//   Answers({this.answerText, this.status});

//   Answers.fromJson(Map<String, dynamic> json) {
//     answerText = json['answer_text'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['answer_text'] = this.answerText;
//     data['status'] = this.status;
//     return data;
//   }
// }
class QuestionModel {
  int? question;
  String? questionText;
  List<Answers>? answers;
  int? favorite;

  QuestionModel(
      {this.question, this.questionText, this.answers, this.favorite});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    questionText = json['question_text'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['question_text'] = this.questionText;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['favorite'] = this.favorite;
    return data;
  }
}

class Answers {
  String? answerText;
  bool? status;

  Answers({this.answerText, this.status});

  Answers.fromJson(Map<String, dynamic> json) {
    answerText = json['answer_text'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_text'] = this.answerText;
    data['status'] = this.status;
    return data;
  }
}

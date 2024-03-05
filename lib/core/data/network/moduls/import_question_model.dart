class importQuestionModel {
  String? questionText;
  int? question;
  String? uuid;

  importQuestionModel({this.questionText, this.question, this.uuid});

  importQuestionModel.fromJson(Map<String, dynamic> json) {
    questionText = json['question_text'];
    question = json['question'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_text'] = this.questionText;
    data['question'] = this.question;
    data['uuid'] = this.uuid;
    return data;
  }
}

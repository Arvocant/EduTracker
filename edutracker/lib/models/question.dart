enum Type {
  mc,
  oq,
  cc
}

class Question {
  String qid = "";
  int question_number = 0;
  String title = "";
  String answ = "";
  Type type = Type.mc;

  Question(String qid, String , String title, Type type) {
    this.qid = qid;
    this.title = title;
    this.answ = answ;
    this.type = type;
  }

  Question.fromDB(this.qid, Map data) {
    qid = data['qid'].toString();
    title = data['title'].toString();
    answ = data['answ'].toString();
    type = Type.values.firstWhere((e) => e.toString() == data['type'].toString());
  }

  @override
  String toString() {
    return "qid: " + qid
    + '\n\t' + "question_number: " + question_number.toString()
    + '\n\t' + "title: " + title.toString()
    + '\n\t' + "answ: " + answ.toString()
    + '\n\t' + "type: " + type.toString();
  }
}
// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

/*class Questions {
  Questions({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}*/

class Questions {
  Questions({
    this.id,
    this.courseId,
    this.topicId,
    this.qid,
    this.text,
    this.instructions,
    this.resource,
    this.options,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.qtype,
    this.confirmed,
    this.public,
    this.flagged,
    this.deleted,
    this.editors,
    this.editorId,
    this.deletedAt,
    this.topic,
    this.answers,
  });

  int? id;
  int? courseId;
  int? topicId;
  String? qid;
  String? text;
  String? instructions;
  String? resource;
  String? options;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? qtype;
  int? confirmed;
  int? public;
  int? flagged;
  int? deleted;
  String? editors;
  dynamic? editorId;
  dynamic? deletedAt;
  Topic? topic;
  List<Answer>? answers;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    id: json["id"],
    courseId: json["course_id"],
    topicId: json["topic_id"],
    qid: json["qid"],
    text: json["text"],
    instructions: json["instructions"],
    resource: json["resource"],
    options: json["options"],
    position: json["position"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    qtype: json["qtype"],
    confirmed: json["confirmed"],
    public: json["public"],
    flagged: json["flagged"],
    deleted: json["deleted"],
    editors: json["editors"],
    editorId: json["editor_id"],
    deletedAt: json["deleted_at"],
    //topic: json["topic"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "topic_id": topicId,
    "qid": qid,
    "text": text,
    "instructions": instructions,
    "resource": resource,
    "options": options,
    "position": position,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "qtype": qtype,
    "confirmed": confirmed,
    "public": public,
    "flagged": flagged,
    "deleted": deleted,
    "editors": editors,
    "editor_id": editorId,
    "deleted_at": deletedAt,
    "topic": topic == null ? null : topic!.toJson(),
    "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
  };
}

class Answer {
  Answer({
    required this.id,
    required this.questionId,
    required this.text,
    required this.value,
    required this.solution,
    required this.createdAt,
    required this.updatedAt,
    required this.answerOrder,
    required this.responses,
    required this.flagged,
    required this.editors,
    this.editorId,
    this.deletedAt,
  });

  int id;
  int questionId;
  String text;
  int value;
  String solution;
  DateTime createdAt;
  DateTime updatedAt;
  int answerOrder;
  int responses;
  int flagged;
  String editors;
  dynamic editorId;
  dynamic deletedAt;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    questionId: json["question_id"],
    text: json["text"],
    value: json["value"],
    solution: json["solution"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    answerOrder: json["answer_order"] ?? 1,
    responses: json["responses"],
    flagged: json["flagged"],
    editors: json["editors"],
    editorId: json["editor_id"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question_id": questionId,
    "text": text,
    "value": value,
    "solution": solution,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "answer_order": answerOrder,
    "responses": responses,
    "flagged": flagged,
    "editors": editors,
    "editor_id": editorId,
    "deleted_at": deletedAt,
  };
}

class Topic {
  Topic({
    required this.id,
    required this.courseId,
    required this.topicId,
    required this.name,
    required this.author,
    required this.description,
    required this.notes,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.confirmed,
    required this.public,
    required this.n,
    required this.p,
    required this.editors,
    this.editorId,
    this.deletedAt,
  });

  int id;
  int courseId;
  String topicId;
  String name;
  String author;
  String description;
  String notes;
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  int confirmed;
  int public;
  int n;
  int p;
  String editors;
  dynamic editorId;
  dynamic deletedAt;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    courseId: json["course_id"],
    topicId: json["topicID"],
    name: json["name"],
    author: json["author"],
    description: json["description"],
    notes: json["notes"],
    category: json["category"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    confirmed: json["confirmed"],
    public: json["public"],
    n: json["N"],
    p: json["p"],
    editors: json["editors"],
    editorId: json["editor_id"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "topicID": topicId,
    "name": name,
    "author": author,
    "description": description,
    "notes": notes,
    "category": category,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "confirmed": confirmed,
    "public": public,
    "N": n,
    "p": p,
    "editors": editors,
    "editor_id": editorId,
    "deleted_at": deletedAt,
  };
}


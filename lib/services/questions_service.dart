import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproject/constants/strings.dart';
import 'package:testproject/models/questions.dart';


class QuestionsService{
  // Get project info...
  Future<List<Questions>> getQuestionsList() async {
    List<Questions> questionsList = [];
    http.Response response = await http.get(Uri.parse(Strings.questionsURL));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      questionsList = (responseJson['data'] as List)
          .map((p) => Questions.fromJson(p))
          .toList();
    }
    return questionsList;
  }
}
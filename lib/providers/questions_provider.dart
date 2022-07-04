import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:testproject/models/questions.dart';
import 'package:testproject/services/questions_service.dart';

class QuestionsProvider extends ChangeNotifier{

  QuestionsService get service => GetIt.I<QuestionsService>();

  Questions questions = new Questions();
  List<Questions> _data = [];
  List<Questions> get data => _data;

  late bool isLoading;

  QuestionsProvider(){
    getData();
  }

  getData() async {
    isLoading = true;
    _data = await service.getQuestionsList();
    isLoading = false;
    notifyListeners();
  }

}
import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  final homeRepository = new HomeRepository();

  UserModel? user;
  List<QuizModel>? quizzes;

  set state(HomeState state) => this.stateNotifier.value = state;
  HomeState get state => this.stateNotifier.value;

  void getUser() async {
    state = HomeState.loading;
    this.user = await this.homeRepository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    this.quizzes = await this.homeRepository.getQuizzes();
    state = HomeState.success;
  }
}

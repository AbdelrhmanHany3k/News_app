import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetSourceLoadingState extends HomeStates {}

class HomeGetSourceErrorState extends HomeStates {
  String error;
  HomeGetSourceErrorState(this.error);
}

class HomeGetSourceSuccessState extends HomeStates {
  SourceResponse sourceResponse;
  HomeGetSourceSuccessState(this.sourceResponse);
}

class HomeGetNewsDataLoadingState extends HomeStates {}

class HomeGetNewsDataErrorState extends HomeStates {}

class HomeGetNewsDataSuccessState extends HomeStates {
  NewsDataResponse newsResponse;
  HomeGetNewsDataSuccessState(this.newsResponse);
}

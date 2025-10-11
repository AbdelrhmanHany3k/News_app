import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  NewsDataResponse? newsDataResponse;
  SourceResponse? sourceResponse;
  int selectedIndex = 0;

  static HomeCubit getCubit(context) => BlocProvider.of(context);

  Future<void> getSources(String categoryId) async {
    emit(HomeGetSourceLoadingState());
    try {
      Uri url = Uri.https("newsapi.org", "v2/top-headlines/sources", {
        "apiKey": "23435f14ebbd4d07a773963f4b0f597e",
        "category": categoryId
      });

      http.Response response = await http.get(url);
      Map<String, dynamic> jsonFormat = jsonDecode(response.body);
      SourceResponse sources = SourceResponse.fromJson(jsonFormat);

      if (response.statusCode != 200) {
        emit(HomeGetSourceErrorState(sources.message ?? ""));
        return;
      }

      sourceResponse = sources;
      emit(HomeGetSourceSuccessState(sources));

      // Load news for first source automatically
      if (sources.sources!.isNotEmpty) {
        await getNewsData(0);
      }
    } catch (e) {
      emit(HomeGetSourceErrorState("Something went wrong"));
    }
  }

  Future<void> getNewsData(int index) async {
    selectedIndex = index;
    emit(HomeGetNewsDataLoadingState());

    try {
      String? sourceId = sourceResponse?.sources?[index].id;
      if (sourceId == null) {
        emit(HomeGetNewsDataErrorState());
        return;
      }

      Uri url = Uri.https("newsapi.org", "v2/everything", {
        "apiKey": "23435f14ebbd4d07a773963f4b0f597e",
        "sources": sourceId,
      });

      http.Response response = await http.get(url);
      Map<String, dynamic> jsonFormat = jsonDecode(response.body);
      NewsDataResponse newsData = NewsDataResponse.fromJson(jsonFormat);

      if (response.statusCode != 200) {
        emit(HomeGetNewsDataErrorState());
        return;
      }

      newsDataResponse = newsData;
      emit(HomeGetNewsDataSuccessState(newsData));
    } catch (e) {
      emit(HomeGetNewsDataErrorState());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Bloc/states.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitState());

  NewsDataResponse? newsDataResponse;
  SourceResponse? sourceResponse;
  int selectedIndex = 0;

  static HomeCubit getCubit(context) => BlocProvider.of(context);

  Future<void> getSources(String categoryId) async {
    emit(HomeGetSourceLoadingState());
    try {
      final sources = await repo.getSources(categoryId);

      if (sources.status != "ok") {
        emit(HomeGetSourceErrorState(sources.message ?? "Error loading sources"));
        return;
      }

      sourceResponse = sources;
      emit(HomeGetSourceSuccessState(sources));

      // Load news for the first source automatically
      if (sources.sources != null && sources.sources!.isNotEmpty) {
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
      final sourceId = sourceResponse?.sources?[index].id;
      if (sourceId == null) {
        emit(HomeGetNewsDataErrorState());
        return;
      }

      final newsData = await repo.getNewsData(sourceId);

      if (newsData.status != "ok") {
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

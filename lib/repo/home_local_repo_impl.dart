import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeLocalRepoImp implements HomeRepo{
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}
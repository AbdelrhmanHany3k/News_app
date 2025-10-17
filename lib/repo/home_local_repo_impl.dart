import 'package:news_app/cache_helper/cache_helper.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeLocalRepoImp implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    return await CacheHelper.getNews();
  }

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    return await CacheHelper.getSources();
  }
}

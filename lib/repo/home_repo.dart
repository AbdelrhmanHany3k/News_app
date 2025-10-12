import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

abstract class HomeRepo {

  Future<NewsDataResponse> getNewsData(String sourceId);

  Future<SourceResponse> getSources(String categoryId);

}

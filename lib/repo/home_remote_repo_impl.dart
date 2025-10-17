import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/cache_helper/cache_helper.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeRemoteRepoImp implements HomeRepo{

  @override
  Future<NewsDataResponse> getNewsData(String sourceId)async {
    Uri url = Uri.https("newsapi.org", "v2/everything", {
      "apiKey": "23435f14ebbd4d07a773963f4b0f597e",
      "sources": sourceId,
    });

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsData = NewsDataResponse.fromJson(jsonFormat);
    return newsData;
  }

  @override
  Future<SourceResponse> getSources(String categoryId) async{
    Uri url = Uri.https("newsapi.org", "v2/top-headlines/sources", {
      "apiKey": "23435f14ebbd4d07a773963f4b0f597e",
      "category": categoryId
    });

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sources = SourceResponse.fromJson(jsonFormat);
    await CacheHelper.saveSources(sources);
    return sources;
  }
  
}
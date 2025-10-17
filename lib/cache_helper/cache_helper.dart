import 'dart:io';
import 'package:hive/hive.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:path_provider/path_provider.dart';

class CacheHelper {
  // ------------------ Sources ------------------
  static Future<void> saveSources(SourceResponse source) async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'sources'},
      path: appDocDirectory.path,
    );

    final sourcesBox = await collection.openBox<Map>('sources');
    await sourcesBox.put("newsSources", source.toJson());
  }

  static Future<SourceResponse> getSources() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'sources'},
      path: appDocDirectory.path,
    );

    final sourcesBox = await collection.openBox<Map>('sources');
    final sources = await sourcesBox.get('newsSources');
    return SourceResponse.fromJson(sources);
  }

  // ------------------ News ------------------
  static Future<void> saveNews(NewsDataResponse news) async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'news'},
      path: appDocDirectory.path,
    );

    final newsBox = await collection.openBox<Map>('news');
    await newsBox.put("newsData", news.toJson());
  }

  static Future<NewsDataResponse> getNews() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'news'},
      path: appDocDirectory.path,
    );

    final newsBox = await collection.openBox<Map>('news');
    final news = await newsBox.get('newsData');
    return NewsDataResponse.fromJson(news);
  }
}

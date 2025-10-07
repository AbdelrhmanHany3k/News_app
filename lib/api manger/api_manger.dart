import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class ApiManager {

  static Future<SourceResponse> getSources(String id) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https("newsapi.org", "v2/top-headlines/sources",
        {"apiKey": "23435f14ebbd4d07a773963f4b0f597e",
         "category":id
        });

    http.Response response = await http.get(url);

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }

  static Future<NewsDataResponse> getNewsData(String sourceID)async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=API_KEY
    Uri url = Uri.https("newsapi.org", "v2/everything", {
      "apiKey": "23435f14ebbd4d07a773963f4b0f597e",
      "sources":sourceID
      }
    );

    http.Response response=await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsResponse=NewsDataResponse.fromJson(jsonFormat);
    return newsResponse;
  }

}
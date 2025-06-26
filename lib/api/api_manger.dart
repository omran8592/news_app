import "dart:convert";
import "package:http/http.dart" as http;
import "package:news_app/model/SourceResponse.dart";
import "../model/NewsResponse.dart";
import "api_constatnts.dart";
import "end_points.dart";
class ApiManager{
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=2021950494f948cdb0aac7792aa08704
   */
  static  Future<SourceResponse?>  getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey,
        "category":categoryId
        });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }

    }
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=2021950494f948cdb0aac7792aa08704
     */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}
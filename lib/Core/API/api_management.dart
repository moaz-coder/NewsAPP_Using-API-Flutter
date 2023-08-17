import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Core/Sourcesresponse/NewsResponse.dart';
import 'package:newsapp/Core/Sourcesresponse/SourcesResponse.dart';

class ApiManagement {
  static const String basedUrl = 'newsapi.org';
  static const String apiKey = 'f6ec2ca63955482a9b71d7a32f111fbc';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(basedUrl, '/v2/top-headlines/sources',
        {'category': categoryId, 'apiKey': apiKey});
    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.https(
        basedUrl, '/v2/everything', {'sources': sourceId, 'apiKey': apiKey});
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}

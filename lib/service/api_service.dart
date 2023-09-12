import 'package:dio/dio.dart';

import '../model/news_response.dart';
import 'dio_service.dart';

class ApiService {
  static const baseUrl = 'https://newsapi.org/v2/top-headlines?';
  // TODO: Add API Key
  static const apiKey = 'apiKey=';

  static Future<NewsResponse> getResponse({String country = 'in'}) async {
    late final NewsResponse newsResponse;
    country = '&country=$country';
    final String url = baseUrl + apiKey + country;
    try {
      DioService().instance().close();
      final Response response = await DioService().instance().get(url);
      newsResponse = NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
    return newsResponse;
  }
}

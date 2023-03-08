import 'dart:convert';
import 'package:clean_tutorial1/app/core/constants/app_constant.dart';
import 'package:clean_tutorial1/app/home/data/data_source/result.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  http.Client client;
  PixabayApi(this.client);

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            "${AppConstant.baseUrl}?key=${AppConstant.apiKey}=$query&image_type=photo&pretty=true"),
      );

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      Iterable hits = jsonResponse['hits'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}

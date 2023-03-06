import 'dart:convert';
import 'package:clean_tutorial1/app/home/data/data_source/result.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  http.Client client;
  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '33413372-901d0022a83ed8d09e4f90425&q';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl?key=$key=$query&image_type=photo&pretty=true"),
      );

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      Iterable hits = jsonResponse['hits'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}

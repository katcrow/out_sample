import 'dart:convert';
import 'package:http/http.dart' as http;

import 'sample_result.dart';

class SamplePixabayApi {
  http.Client client;
  SamplePixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '33413372-901d0022a83ed8d09e4f90425&q';

  Future<SampleResult<Iterable>> fetch(String query) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl?key=$key=$query&image_type=photo&pretty=true"),
      );

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      Iterable hits = jsonResponse['hits'];

      return SampleResult.success(hits);

    } catch (e) {
      return const SampleResult.error('네트워크 에러');
    }
  }
}

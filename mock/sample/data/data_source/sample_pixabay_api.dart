import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_constant.dart';
import 'sample_result.dart';

class SamplePixabayApi {
  http.Client client;
  SamplePixabayApi(this.client);

  Future<SampleResult<Iterable>> fetch(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            "${SampleAppConstant.baseUrl}?key=${SampleAppConstant.apiKey}=$query&image_type=photo&pretty=true"),
      );

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      Iterable hits = jsonResponse['hits'];

      return SampleResult.success(hits);
    } catch (e) {
      return const SampleResult.error('네트워크 에러');
    }
  }
}

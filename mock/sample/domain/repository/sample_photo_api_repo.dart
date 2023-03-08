import '../../data/data_source/sample_result.dart';
import '../model/sample_photo.dart';

abstract class SamplePhotoApiRepo {
  Future<SampleResult<List<SamplePhoto>>> fetch(String query);
}
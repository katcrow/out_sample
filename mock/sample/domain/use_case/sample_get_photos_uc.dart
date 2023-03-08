import '../../data/data_source/sample_result.dart';
import '../model/sample_photo.dart';
import '../repository/sample_photo_api_repo.dart';

class SampleGetPhotosUc {
  final SamplePhotoApiRepo repository;

  SampleGetPhotosUc(this.repository);

  Future<SampleResult<List<SamplePhoto>>> call(String query) async {
    final result = await repository.fetch(query);

    return result.when(
      success: (photos) {
        return SampleResult.success(photos);
      },
      error: (message) {
        return SampleResult.error(message);
      },
    );
  }
}


import '../../domain/model/sample_photo.dart';
import '../../domain/repository/sample_photo_api_repo.dart';
import '../data_source/sample_pixabay_api.dart';
import '../data_source/sample_result.dart';

class SamplePhotoApiRepoImpl implements SamplePhotoApiRepo {
  SamplePixabayApi api;

  SamplePhotoApiRepoImpl(this.api);

  @override
  Future<SampleResult<List<SamplePhoto>>> fetch(String query) async {
    final SampleResult<Iterable> result = await api.fetch(query);

    return result.when(
      success: (iterable) {
        return SampleResult.success(iterable.map((e) => SamplePhoto.fromJson(e)).toList());
      },
      error: (message) {
        return SampleResult.error(message);
      },
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_photo.freezed.dart';
part 'sample_photo.g.dart';

@freezed
class SamplePhoto with _$SamplePhoto {
  factory SamplePhoto({
    required int id,
    required String tags,
    required String previewURL,
  }) = _SamplePhoto;

  factory SamplePhoto.fromJson(Map<String, dynamic> json) => _$SamplePhotoFromJson(json);
}

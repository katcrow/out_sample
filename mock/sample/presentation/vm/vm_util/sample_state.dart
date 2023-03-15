import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/model/sample_photo.dart';

part 'sample_state.freezed.dart';
part 'sample_state.g.dart';

@freezed
class SampleState with _$SampleState {
  factory SampleState({
    required List<SamplePhoto> photos,
    required bool isLoading,
  }) = _SampleState;

  factory SampleState.fromJson(Map<String, dynamic> json) => _$SampleStateFromJson(json);
}

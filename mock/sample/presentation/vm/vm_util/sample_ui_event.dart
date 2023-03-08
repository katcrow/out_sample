import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_ui_event.freezed.dart';


@freezed
abstract class SampleUiEvent<T> with _$SampleUiEvent<T> {
  const factory SampleUiEvent.showSnackBar(String message) = ShowSnackBar;
  // const factory SampleUiEvent.error(String e) = Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_result.freezed.dart';


@freezed
abstract class SampleResult<T> with _$SampleResult<T> {
  const factory SampleResult.success(T data) = Success;
  const factory SampleResult.error(String e) = Error;
}

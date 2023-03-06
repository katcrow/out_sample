import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/photo.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required List<Photo> photos,
    required bool isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}


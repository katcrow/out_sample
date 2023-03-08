import 'dart:async';
import 'package:clean_tutorial1/mock/sample/presentation/vm/vm_util/sample_state.dart';
import 'package:flutter/material.dart';
import '../../data/data_source/sample_result.dart';
import '../../domain/model/sample_photo.dart';
import '../../domain/use_case/sample_get_photos_uc.dart';
import 'vm_util/sample_ui_event.dart';

/// viewModel 은 간단하게 데이터 전달 역할만 하는게 좋다

class SampleViewModel with ChangeNotifier {
  final SampleGetPhotosUc getPhotosUc;

  /// state
  SampleState _state = SampleState(photos: [], isLoading: false);

  SampleState get state => _state;

  final _eventController = StreamController<SampleUiEvent>();

  Stream<SampleUiEvent> get eventStream => _eventController.stream;

  /// constructor
  SampleViewModel(this.getPhotosUc);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final SampleResult<List<SamplePhoto>> result = await getPhotosUc(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(SampleUiEvent.showSnackBar(message));
      },
    );

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}

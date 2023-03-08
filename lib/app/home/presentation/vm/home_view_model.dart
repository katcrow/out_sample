import 'dart:async';
import 'package:clean_tutorial1/app/home/domain/model/photo.dart';
import 'package:clean_tutorial1/app/home/presentation/vm/vm_util/home_state.dart';
import 'package:clean_tutorial1/app/home/presentation/vm/vm_util/home_ui_event.dart';
import 'package:flutter/material.dart';
import '../../data/data_source/result.dart';
import '../../domain/use_case/get_photos_use_case.dart';

/// viewModel 은 간단하게 데이터 전달 역할만 하는게 좋다

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  // state
  HomeState _state = HomeState(photos: [], isLoading: false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  // constructor
  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}

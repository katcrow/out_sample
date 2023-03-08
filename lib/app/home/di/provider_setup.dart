import 'package:clean_tutorial1/app/home/presentation/vm/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;
import '../data/data_source/pixabay_api.dart';
import '../data/repository/photo_api_repository_impl.dart';
import '../domain/repository/photo_api_repository.dart';
import '../domain/use_case/get_photos_use_case.dart';

/// 1. provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

/// 2. 독립적인 프로바이더 (의존하지 않는)
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

/// 3. 2번의 의존성을 가지는 프로바이더 (의존하는)
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) {
      return PixabayApi(client);
    },
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) {
      return PhotoApiRepositoryImpl(api);
    },
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
    update: (context, repository, _) {
      return GetPhotosUseCase(repository);
    },
  ),
];

/// 4. viewModel
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) {
      return HomeViewModel(context.read<GetPhotosUseCase>());
      // return context.read<HomeViewModel>();
    },
  ),
];

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

import '../data/data_source/sample_pixabay_api.dart';
import '../data/repository/sample_photo_api_repo_impl.dart';
import '../domain/repository/sample_photo_api_repo.dart';
import '../domain/use_case/sample_get_photos_uc.dart';
import '../presentation/vm/sample_view_model.dart';

/// 1. provider 전체
List<SingleChildWidget> sampleGlobalProviders = [
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
  ProxyProvider<http.Client, SamplePixabayApi>(
    update: (context, client, _) {
      return SamplePixabayApi(client);
    },
  ),
  ProxyProvider<SamplePixabayApi, SamplePhotoApiRepo>(
    update: (context, api, _) {
      return SamplePhotoApiRepoImpl(api);
    },
  ),
  ProxyProvider<SamplePhotoApiRepo, SampleGetPhotosUc>(
    update: (context, repository, _) {
      return SampleGetPhotosUc(repository);
    },
  ),
];

/// 4. viewModel
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<SampleViewModel>(
    create: (context) {
      return SampleViewModel(context.read<SampleGetPhotosUc>());
      // return context.read<HomeViewModel>();
    },
  ),
];

// import 'package:clean_tutorial1/data/repository/sample_photo_api_repo_impl.dart';
// import 'package:clean_tutorial1/app/home/presentation/vm/home_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../data/data_source/sample_pixabay_api.dart';
// import '../../../domain/repository/sample_photo_api_repo.dart';
// import '../../../domain/use_case/sample_get_photos_uc.dart';
//
// /// 1. provider 전체
// List<SingleChildWidget> globalProviders = [
//   ...independentModels,
//   ...dependentModels,
//   ...viewModels,
// ];
//
// /// 2. 독립적인 프로바이더 (의존하지 않는)
// List<SingleChildWidget> independentModels = [
//   Provider<http.Client>(
//     create: (context) => http.Client(),
//   ),
// ];
//
// /// 3. 2번의 의존성을 가지는 프로바이더 (의존하는)
// List<SingleChildWidget> dependentModels = [
//   ProxyProvider<http.Client, PixabayApi>(
//     update: (context, client, _) {
//       return PixabayApi(client);
//     },
//   ),
//   ProxyProvider<PixabayApi, PhotoApiRepository>(
//     update: (context, api, _) {
//       return PhotoApiRepositoryImpl(api);
//     },
//   ),
//   ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
//     update: (context, repository, _) {
//       return GetPhotosUseCase(repository);
//     },
//   ),
// ];
//
// /// 4. viewModel
// List<SingleChildWidget> viewModels = [
//   ChangeNotifierProvider<HomeViewModel>(
//     create: (context) {
//       return HomeViewModel(context.read<GetPhotosUseCase>());
//       // return context.read<HomeViewModel>();
//     },
//   ),
// ];

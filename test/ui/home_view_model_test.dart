// import 'package:clean_tutorial1/data/data_source/sample_result.dart';
// import 'package:clean_tutorial1/domain/repository/sample_photo_api_repo.dart';
// import 'package:clean_tutorial1/domain/model/sample_photo.dart';
// import 'package:clean_tutorial1/domain/use_case/sample_get_photos_uc.dart';
// import 'package:clean_tutorial1/app/home/presentation/vm/home_view_model.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   test('Stream 잘 동작해야한다', () async {
//     final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));
//
//     await viewModel.fetch('apple');
//
//     final result = fakeJson.map((e) => Photo.fromJson(e)).toList();
//
//     expect(
//       viewModel.state.photos,
//       result,
//     );
//   });
// }
//
// class FakePhotoApiRepository extends PhotoApiRepository {
//   @override
//   Future<Result<List<Photo>>> fetch(String query) async {
//     Future.delayed(const Duration(milliseconds: 500));
//
//     return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
//   }
// }
//
// /// fakeData
// List<Map<String, dynamic>> fakeJson = [
//   {
//     "id": 2295434,
//     "pageURL": "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
//     "type": "photo",
//     "tags": "spring bird, bird, tit",
//     "previewURL":
//         "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
//     "previewWidth": 150,
//     "previewHeight": 99,
//     "webformatURL":
//         "https://pixabay.com/get/gf1a450546181ab4338059452217dc556dc717f000f095a86c9e6ed60c9a99d0bfcba7eb69a14bf65988aefa38542afb01abc3d0a9b0653f1663bf172892b8914_640.jpg",
//     "webformatWidth": 640,
//     "webformatHeight": 426,
//     "largeImageURL":
//         "https://pixabay.com/get/ga834982cbcdd0254ea0d76e28652631600768580ddd12cb356ccc5c76a145eb5ccf98ef6ea3cfaf89d1c4a92ad0c2cc8ba03d31d3e8d9cda62ac13382c364854_1280.jpg",
//     "imageWidth": 5363,
//     "imageHeight": 3575,
//     "imageSize": 2938651,
//     "views": 630729,
//     "downloads": 364859,
//     "collections": 2074,
//     "likes": 1988,
//     "comments": 253,
//     "user_id": 334088,
//     "user": "JillWellington",
//     "userImageURL": "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
//   },
//   {
//     "id": 3063284,
//     "pageURL": "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
//     "type": "photo",
//     "tags": "rose, flower, petal",
//     "previewURL": "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
//     "previewWidth": 150,
//     "previewHeight": 99,
//     "webformatURL":
//         "https://pixabay.com/get/g3660cb3a7bb635a4748aaf155e1aa29fb7c48f4370ea00e2896724a59b7870c34abd0ff73f61221173bbb0143d140deba9bada978a8914348f083c8ef1bb0d2f_640.jpg",
//     "webformatWidth": 640,
//     "webformatHeight": 426,
//     "largeImageURL":
//         "https://pixabay.com/get/g9de330dde320bd5f4b04f8552dda199fe438f576f6485938f82ab13f5efebbfec0ebe3f0b5c75fd83392cf840fa8c2755645f2074269197d3d6c9af8cee82e73_1280.jpg",
//     "imageWidth": 6000,
//     "imageHeight": 4000,
//     "imageSize": 3574625,
//     "views": 1047718,
//     "downloads": 677180,
//     "collections": 1410,
//     "likes": 1530,
//     "comments": 329,
//     "user_id": 1564471,
//     "user": "anncapictures",
//     "userImageURL": "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
//   },
//   {
//     "id": 1127174,
//     "pageURL": "https://pixabay.com/photos/sunflower-flower-plant-petals-1127174/",
//     "type": "photo",
//     "tags": "sunflower, flower, plant",
//     "previewURL":
//         "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_150.jpg",
//     "previewWidth": 150,
//     "previewHeight": 99,
//     "webformatURL":
//         "https://pixabay.com/get/g8690fad1c7d2d54e19185dfe15aa03549374d4079f51816b1106993b1a751f67433d40b2efb277ce9cd2edf2780d9edf2adc5bb50e50040bfdb0dcb199d470df_640.jpg",
//     "webformatWidth": 640,
//     "webformatHeight": 426,
//     "largeImageURL":
//         "https://pixabay.com/get/g4489f3eac61c484c5d7451c2431c7890e14f48a379530f9684e54c6e7ba75f6dce2b7e40cac7100f9806a2d1e36b8cb4197693f2ad4f762b4156d5d2f596ca2b_1280.jpg",
//     "imageWidth": 4752,
//     "imageHeight": 3168,
//     "imageSize": 3922163,
//     "views": 483577,
//     "downloads": 313695,
//     "collections": 1066,
//     "likes": 1064,
//     "comments": 156,
//     "user_id": 1445608,
//     "user": "mploscar",
//     "userImageURL": "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
//   },
// ];

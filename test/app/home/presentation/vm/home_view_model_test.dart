import 'package:clean_tutorial1/app/home/data/data_source/result.dart';
import 'package:clean_tutorial1/app/home/domain/model/photo.dart';
import 'package:clean_tutorial1/app/home/domain/repository/photo_api_repository.dart';
import 'package:clean_tutorial1/app/home/domain/use_case/get_photos_use_case.dart';
import 'package:clean_tutorial1/app/home/presentation/vm/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Stream 잘 동작해야한다', () async {
    final viewModel = HomeViewModel(
      GetPhotosUseCase(
        FakePhotoApiRepository(),
      ),
    );

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.state.photos,
      result,
    );

    expect(
      viewModel.state.photos.length,
      3,
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    // delay
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

// fakeData
List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/gaaddfb4c8edd38e55025b375a615d0486bcfc6d9ad27a09ca50c50efe910f30fd074969463befbf3a051976d429dc247_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g1cde3e57bb7340263be425e4e169c73d56901b468a7271090246d5ae6fb98c2c810c9e641f11f51e4a482045b6f2eeaf4c66f86e5ee9970d395acaf5a4108588_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 474537,
    "downloads": 277318,
    "collections": 1268,
    "likes": 2352,
    "comments": 194,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g06ccdb77bbda07b24bb59278f977a0f8c86f1e437c1aca18a077aa4892558c52f20345be0489d309d2b8201c774c04d46d967cb03b80e733b8b223eb5f541811_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g419c63dcbefad8a3989e519ecd252417c7cfe45fecc3ecb07d6280e39ff40282609f560e408ed32322c91c1a67b8e2f45a98fde1a8c392704b1c893160d63097_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 678340,
    "downloads": 492945,
    "collections": 1374,
    "likes": 1028,
    "comments": 274,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
  {
    "id": 1873078,
    "pageURL": "https://pixabay.com/photos/apples-orchard-apple-trees-1873078/",
    "type": "photo",
    "tags": "apples, orchard, apple trees",
    "previewURL": "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/ge4957230f5899d8ca0c58c21a1b5711884a03f04121560a8d057db52c79186e2e48ca083d20675ae16878678323a40546f03337abff6671c3881d332d27e98be_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 408,
    "largeImageURL":
        "https://pixabay.com/get/g17750a1cdcb8080ee85fa07d21d4f3e12060b3997068f980921852a6f9191a2e314abefb0e7836a4e096414b17551286b4d0dc78d02509b8d9add1c7504bf9eb_1280.jpg",
    "imageWidth": 3212,
    "imageHeight": 2051,
    "imageSize": 2581012,
    "views": 433592,
    "downloads": 251288,
    "collections": 1127,
    "likes": 1136,
    "comments": 175,
    "user_id": 3890388,
    "user": "lumix2004",
    "userImageURL": ""
  },
];

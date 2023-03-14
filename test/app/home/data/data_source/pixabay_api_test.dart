import 'package:clean_tutorial1/app/home/data/data_source/pixabay_api.dart';
import 'package:clean_tutorial1/app/home/data/data_source/result.dart';
import 'package:clean_tutorial1/app/home/data/repository/photo_api_repository_impl.dart';
import 'package:clean_tutorial1/app/home/domain/model/photo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';

// @GenerateMocks([http.Client])
void main() {
  test('Pixabay 데이터를 가져와야 한다', () async {
    final api = PhotoApiRepositoryImpl(
      PixabayApi(http.Client()),
    );

    final Result<List<Photo>> result = await api.fetch('iphone');

    expect(
      (result as Success<List<Photo>>).data.first.id,
      2681039,
    );

    expect(
      result.data.length,
      20,
    );
  });
}

// fakeData
String fakeJson = """
   {
            "id":2681039,
            "pageURL":"https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/",
            "type":"photo",
            "tags":"phone wallpaper, watercolor, painting",
            "previewURL":"https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg",
            "previewWidth":99,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g85f779c832388b33264434d70a19dc4186c353cfc1fcc5867fb7ea2092e824a94a09f077e04e0ef3763e685f43698a040f08cd812939048104aadbef9f904c47_640.jpg",
            "webformatWidth":424,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g898027b7e57fd66f9d1914b904ce131662f42a2b2246e4a6fd71a4ebd5144abef8900a8b4498c8c93db2c58d68700d2efb68e7b46da841d77eafc9550c761b88_1280.jpg",
            "imageWidth":3264,
            "imageHeight":4928,
            "imageSize":5021313,
            "views":1190880,
            "downloads":924362,
            "collections":1926,
            "likes":1229,
            "comments":134,
            "user_id":4894494,
            "user":"eluela31",
            "userImageURL":"https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
        },
        {
            "id":1599527,
            "pageURL":"https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/",
            "type":"photo",
            "tags":"phone wallpaper, mystery, island",
            "previewURL":"https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg",
            "previewWidth":116,
            "previewHeight":150,
            "webformatURL":"https://pixabay.com/get/g545cbb166914a36acca35c1725b51c1b2ecc1aa2a93da33eb7d2487393ea463ac9ab8498d6fa3914a8b61c5d9c6703405b1d48a152a6118aa4515d3df1706e61_640.jpg",
            "webformatWidth":495,
            "webformatHeight":640,
            "largeImageURL":"https://pixabay.com/get/g04e655746807883b98dbdd8eb33f11761f378eeb284f121918345b84457a977223e35f8f5b71e01768790bdaff638077edbfafa30b2ea5ea7e2e1cab6735ae24_1280.jpg",
            "imageWidth":3022,
            "imageHeight":3907,
            "imageSize":3563541,
            "views":803932,
            "downloads":449408,
            "collections":1405,
            "likes":1358,
            "comments":166,
            "user_id":2633886,
            "user":"intographics",
            "userImageURL":"https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"
        },
        {
            "id":620817,
            "pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/",
            "type":"photo",
            "tags":"office, notes, notepad",
            "previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg",
            "previewWidth":150,
            "previewHeight":99,
            "webformatURL":"https://pixabay.com/get/ga33554ffff77126a911b7c75d54d393b5eb5aeea048a1b678424b54eede93710c70c5e807dd6745aa933e61d51003f85_640.jpg",
            "webformatWidth":640,
            "webformatHeight":425,
            "largeImageURL":"https://pixabay.com/get/g343ec163eb4d05b6d8d87a7144e7cf5c2a9a8e71222876fafccb995175b7d858cb8a79be34f453956a15841cd4213a63bffa8e7af91ada958f925463aa093633_1280.jpg",
            "imageWidth":4288,
            "imageHeight":2848,
            "imageSize":2800224,
            "views":767933,
            "downloads":337021,
            "collections":1352,
            "likes":1148,
            "comments":267,
            "user_id":663163,
            "user":"Firmbee",
            "userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
        },
  """;

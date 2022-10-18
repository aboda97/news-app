import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //عملت الinit دي علشان لما افتح الابليكيشن واستدعي ال DioHelper.init فيقوم معرف ال dio اللي فوق ده
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  }) async
  {
    //ال get محتاج path اللي هو method url
    return await dio.get(url, queryParameters: query,);
  }
}

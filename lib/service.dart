import 'package:dio/dio.dart';

import 'core/api/end_points.dart';
import 'feature/home_page/data/models/sale_model.dart';
import 'feature/home_page/data/models/send_model.dart';


class ServiceApi {
  late Dio dio;

  ServiceApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: 1000 * 60 * 2,
        receiveTimeout: 1000 * 60 * 2,
        receiveDataWhenStatusError: true,
        contentType: "application/json",
        headers: {'Content-Type': 'application/json'});
    dio = Dio(baseOptions);
  }

  Future<SaleModel> getHomeData(SendModel sendModel
      ) async {
    try {
      Response response;
      BaseOptions baseOptions = dio.options;
      CancelToken cancelToken = CancelToken();

        baseOptions.headers = {'Content-Type': 'application/json'};
        dio.options = baseOptions;


      response = await dio.post(
          'get_sales_pipline',
         data: sendModel,
          cancelToken: cancelToken);

      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
print("dlldldldl${response.toString()}");
      return SaleModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      //final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception();
    }
  }


}

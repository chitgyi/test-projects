import 'package:code_management/app/core/network/api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() async {
    Get.put(
      Api(Dio(
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      )
          // ..interceptors.add(
          //     PrettyDioLogger(
          //         requestHeader: true,
          //         requestBody: true,
          //         responseBody: true,
          //         responseHeader: false,
          //         error: true,
          //         compact: true,
          //         maxWidth: 90),
          //   ),
          ),
    );
  }
}

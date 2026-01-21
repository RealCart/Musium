import 'package:dio/dio.dart';
import 'package:musium/core/constants/app_api.dart';

part "ym_client.dart";
part 'google_client.dart';

const Duration timeout = Duration(minutes: 1);

sealed class HttpClient {
  Future<Object> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress, 
  });
}

part of 'http_client.dart';

typedef RequestParams = ();

final class YMClient implements HttpClient {
  YMClient() : _dio = Dio(
    BaseOptions(
      baseUrl: AppApi.baseUrlYM,
      sendTimeout: timeout,
      receiveTimeout: timeout,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }
    )
  );

  final Dio _dio;
  
  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters, 
    Options? options, 
    CancelToken? cancelToken, 
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        url, 
        queryParameters: queryParameters, 
        options: options,
        cancelToken: cancelToken, 
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }
}

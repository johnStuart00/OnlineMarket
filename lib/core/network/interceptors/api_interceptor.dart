import 'package:dio/dio.dart';

/// A class that holds intercepting logic for API related requests. This is
/// the first interceptor in case of both request and response.
///
/// Primary purpose is to handle token injection and response success validation
///
/// Since this interceptor isn't responsible for error handling, if an exception
/// occurs it is passed on the next [Interceptor] or to [Dio].
class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data != null;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}

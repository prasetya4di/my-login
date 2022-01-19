import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockGetConnect extends Mock implements GetConnect {
  Response mockResponse = const Response();
  Fail? mockFail;

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    if (mockFail != null) throw mockFail!;
    return Response<T>(
        statusCode: mockResponse.statusCode, body: mockResponse.body);
  }
}

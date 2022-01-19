import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockGetConnect extends Mock implements GetConnect {
  Response mockResponse = const Response();

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
    return Response<T>(
        statusCode: mockResponse.statusCode, body: mockResponse.body);
  }
}

part of 'network_call.dart';

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://randomuser.me/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> fetchSong(secretKey, token) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{
      r'x-rapidapi-host': secretKey,
      r'x-rapidapi-key': token
    };
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    final result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, '/artists/16775/songs',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
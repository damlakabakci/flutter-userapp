import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'api_path.dart';

part 'network_call.g.dart';

@RestApi(baseUrl: APIPath.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(APIPath.LIST_SONG_PATH)
  Future<dynamic> fetchSong(
    @Header("x-rapidapi-host") String secretKey,
    @Header("x-rapidapi-key") String token
  );
}
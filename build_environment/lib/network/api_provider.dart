import 'package:build_environment/configs/flavor_config.dart';
import 'package:build_environment/models/movie/movie_res.dart';
import 'package:build_environment/network/api_controller.dart';

class ApiProvider {
  final ApiController _apiController = new ApiController();
  final String _apiKey = FlavorConfig.instance.apiKey;

  Future<MovieResponse> getTopMovies(int page) async {
    String url = 'movie/top_rated?language=en-US&api_key=$_apiKey&page=$page';
    final responseJson = await _apiController.request(url, HttpMethod.get);
    print('getTopMovies: ${responseJson}');
    return MovieResponse.fromJson(responseJson);
  }

  Future<MovieResponse> getPopular(int page) async {
    String url = 'movie/popular?language=en-US&api_key=$_apiKey&page=$page';
    final responseJson = await _apiController.request(url, HttpMethod.get);
    print('getPopular: ${responseJson}');
    return MovieResponse.fromJson(responseJson);
  }

  Future<MovieResponse> getNowPlaying(int page) async {
    String url = 'movie/now_playing?language=en-US&api_key=$_apiKey&page=$page';
    final responseJson = await _apiController.request(url, HttpMethod.get);
    print('Response: $responseJson');
    return MovieResponse.fromJson(responseJson);
  }

  Future<MovieResponse> getUpComing(int page) async {
    String url = 'movie/upcoming?language=en-US&api_key=$_apiKey&page=$page';
    final responseJson = await _apiController.request(url, HttpMethod.get);
    print('Response: $responseJson');
    return MovieResponse.fromJson(responseJson);
  }
}

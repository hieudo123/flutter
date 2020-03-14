import 'package:build_environment/common/app_strings.dart';
import 'package:build_environment/models/movie/movie_model.dart';
import 'package:build_environment/network/api_provider.dart';

class CategoriesRepository {
  ApiProvider _apiProvider = new ApiProvider();
  Future<Map<String ,List<MovieModel>>> fetchCategories () async{
    final upComingList = await _apiProvider.getUpComing(1);
    final topRatedList = await _apiProvider.getTopMovies(1);
    final nowPlayingList = await _apiProvider.getNowPlaying(1);
    final popularList = await _apiProvider.getPopular(1);

    return {
      AppStrings.kNowPlaying : nowPlayingList.results,
      AppStrings.kUpcoming : upComingList.results,
      AppStrings.kPopular : popularList.results,
      AppStrings.kTopRated : topRatedList.results,
    };
  }
}
import 'package:build_environment/models/movie/movie_model.dart';

enum CategoryType{
  UpComing,
  TopRated,
  Popular,
  NowPlaying
}

class CategoryModel {

  final CategoryType categoryType;
  final List<MovieModel> categoryContent;

  CategoryModel(this.categoryType, this.categoryContent);
}
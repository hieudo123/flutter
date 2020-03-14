import 'package:build_environment/models/category_model.dart';
import 'package:build_environment/models/movie/movie_model.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadError extends CategoriesState {
  final String error;

  CategoriesLoadError(this.error);
}

class CategoriesLoaded extends CategoriesState {
  final Map<String ,List<MovieModel>> categories;
  final bool hasReachedMax;

  const CategoriesLoaded({this.categories, this.hasReachedMax});

  CategoriesLoaded copyWith({
    Map<String ,List<MovieModel>> list,
    bool hasReachedMax,
  }) {
    return CategoriesLoaded(
      categories: list,
      hasReachedMax: hasReachedMax,
    );
  }
}

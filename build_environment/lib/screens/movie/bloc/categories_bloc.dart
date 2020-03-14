import 'package:build_environment/network/repositories/categories_repository.dart';
import 'package:build_environment/screens/movie/bloc/categories_event.dart';
import 'package:build_environment/screens/movie/bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<GetCategoriesEvent, CategoriesState>{
  CategoriesRepository repository = new CategoriesRepository();
  @override
  CategoriesState get initialState => CategoriesInitial();

  @override
  Stream<CategoriesState> mapEventToState(GetCategoriesEvent event) async* {
    final currentState = state;
    if (event is FetchCategories && !_hasReachedMax(currentState) ){
      try{
        if (currentState is CategoriesInitial){
          final categories = await repository.fetchCategories();
          yield CategoriesLoaded(categories: categories, hasReachedMax: false);
        }
        if (currentState is CategoriesLoaded){
          final categories = await repository.fetchCategories();
          yield currentState.copyWith(hasReachedMax: true);
          print('CategoriesLoaded: ${currentState.categories}');
        }
      }catch(error){
        print('Error : $error');
        yield CategoriesLoadError(error);
      }
    }
  }

  bool _hasReachedMax(CategoriesState state) =>
      state is CategoriesLoaded && state.hasReachedMax;
}
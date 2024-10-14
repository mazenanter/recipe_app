import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/firebase_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.firebaseServices) : super(SearchInitial());
  final FirebaseServices firebaseServices;
  Future<void> searchRecipes({required String q}) async {
    emit(SearchLoading());

    var res = await firebaseServices.searchRecipes(q: q);
    res.fold(
      (fail) {
        log(fail.errMsg);
        emit(SearchError(fail.errMsg));
      },
      (recipes) {
        log('Search Success Items: ${recipes.length.toString()}');
        emit(SearchSuccess(recipes));
      },
    );
  }
}

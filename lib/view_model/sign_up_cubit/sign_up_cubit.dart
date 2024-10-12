import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/services/firebase_services.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.firebaseServices) : super(SignUpInitial());

  final FirebaseServices firebaseServices;

  Future<void> createUser(
      {required String email,
      required String userName,
      required String password}) async {
    emit(SignUpLoading());
    var result = await firebaseServices.createUser(
        email: email, password: password, userName: userName);

    result.fold(
      (fail) => emit(SignUpError(fail.errMsg)),
      (success) => emit(SignUpSuccess()),
    );
  }
}

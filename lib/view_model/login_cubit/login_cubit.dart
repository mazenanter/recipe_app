import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/services/firebase_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.firebaseServices) : super(LoginInitial());
  final FirebaseServices firebaseServices;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var res = await firebaseServices.loginUser(
      email: email,
      password: password,
    );
    return res.fold(
      (fail) => emit(LoginError(fail.errMsg)),
      (success) => emit(LoginSuccess()),
    );
  }
}

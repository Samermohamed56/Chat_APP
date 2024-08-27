import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(
                errMessage: 'Wrong password provided for that user.'));
          } else if (e.code == 'invalid-email') {
            emit(LoginFailure(errMessage: 'The email is invalid.'));
          }
        } catch (e) {
          emit(LoginFailure(errMessage: 'An unexpected error occurred.'));
        }
      } else if (event is RegisterEvent) {}
      
    });
   
  }

}

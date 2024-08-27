import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

   Future<void> loginUser(
      {required String email, required String password}) async {
    
  }

   Future<void> RegisterUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'Password is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'Email already in use.'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: 'An unexpected error occurred.'));
    }
  }
}

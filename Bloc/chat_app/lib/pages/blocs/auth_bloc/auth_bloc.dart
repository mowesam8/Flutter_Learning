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
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: event.email, password: event.password);

          emit(LoginSuccess());
        } on FirebaseAuthException catch (ex) {
          emit(LoginFailure(errorMessage: _messageForCode(ex.code)));
        } on Exception {
          emit(
            LoginFailure(
              errorMessage: 'Something went wrong, please try again.',
            ),
          );
        }
      }
    });
  }

  String _messageForCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
      case 'invalid-login-credentials':
        return 'Incorrect email or password.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Check your connection and try again.';
      default:
        return 'Login failed (${code.replaceAll('-', ' ')}).';
    }
  }
}

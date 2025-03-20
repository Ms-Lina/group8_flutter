import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      if (event.email == "test@example.com" && event.password == "password") {
        emit(AuthSuccess(message: "Login Successful"));
      } else {
        emit(AuthFailure(error: "Invalid credentials"));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthSuccess(message: "Account Created Successfully"));
    });

    // ✅ Correctly placed ForgotPasswordEvent inside the constructor
    on<ForgotPasswordEvent>((event, emit) async {
      emit(AuthLoading());

      await Future.delayed(const Duration(seconds: 2));

      if (event.email == "test@example.com") {
        emit(ForgotPasswordSuccess(message: "Reset code sent to ${event.email}"));
      } else {
        emit(ForgotPasswordFailure(error: "Email not found"));
      }
    });
  }
}

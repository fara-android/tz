import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tz/helpers/catch_exceptions.dart';
import 'package:tz/logic/auth/auth_provider.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthProvider authProvider = AuthProvider();
  AuthCubit() : super(const AuthState.initial());
  login(String login, String password) async {
    try {
      emit(const AuthState.loading());
      final response = await authProvider.login(login, password);
      bool success = response['success'];
      emit(AuthState.loaded(success));
    } catch (error) {
      print(error);
      emit(
        AuthState.failed(
          CatchException.convertException(error).message.toString(),
        ),
      );
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loaded(bool success) = _Loaded;
  const factory AuthState.failed(String error) = _Failed;
}

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang/src/features/authentication/domain/user_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      DataUserAccountLocal.setDataUserAccountToStorage(event.userAccount);
      UserAccountRegister.setUserAccountRegister(event.isRegister);
      await Future.delayed(const Duration(seconds: 5));
      emit(AuthSuccess(
          userAccount: event.userAccount, isRegister: event.isRegister));
    });
  }
}

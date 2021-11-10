import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/domain/models/models.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserNameChanged) {
      yield* _usernameChanged(event.username);
    }
    if (event is LoginPasswordChanged) {
      yield* _passwordChanged(event.password);
    }
  }

  Stream<LoginState> _usernameChanged(String email) async* {
    final _username = Username.dirty(email);
    yield LoginState(
      username: _username,
      password: state.password,
      status: Formz.validate([
        _username,
        state.password,
      ]),
    );
  }

  Stream<LoginState> _passwordChanged(String email) async* {
    final _password = Password.dirty(email);
    yield LoginState(
      username: state.username,
      password: _password,
      status: Formz.validate([
        state.username,
        _password,
      ]),
    );
  }
}

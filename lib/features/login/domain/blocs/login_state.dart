import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/domain/models/models.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Username username;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [username, password, status];
}

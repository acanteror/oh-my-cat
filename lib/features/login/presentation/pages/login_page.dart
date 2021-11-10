import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_cat/features/login/login.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appBarTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UsernameTextField(),
              const SizedBox(
                height: 24,
              ),
              const PasswordTextField(),
              const SizedBox(
                height: 36,
              ),
              const LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

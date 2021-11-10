import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_bloc.dart';
import 'package:oh_my_cat/features/login/domain/blocs/login_state.dart';
import 'package:oh_my_cat/features/random_cat/presentation/pages/random_cat_page.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final _isValid = state.status == FormzStatus.valid;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: _isValid ? Colors.white : Colors.black87,
            primary: _isValid ? Colors.blue : Colors.grey[300],
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          onPressed: () => _isValid ? navigateToRandomCatPage(context) : null,
          child: Text(l10n.loginButton),
        );
      },
    );
  }

  void navigateToRandomCatPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RandomCatPage(),
      ),
    );
  }
}

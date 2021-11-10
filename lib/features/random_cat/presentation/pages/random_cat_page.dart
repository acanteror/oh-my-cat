import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_cat/features/random_cat/domain/blocs/random_cat_bloc.dart';
import 'package:oh_my_cat/features/random_cat/domain/blocs/random_cat_state.dart';
import 'package:oh_my_cat/features/random_cat/infrastructure/repositories/api_random_cat_repository.dart.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class RandomCatPage extends StatelessWidget {
  const RandomCatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomCatCubit(
        repository: ApiRandomCatRepository(),
      ),
      child: RandomCatView(),
    );
  }
}

class RandomCatView extends StatelessWidget {
  static const placeholderCatUrl =
      'https://cataas.com/cat/595f280e557291a9750ebfa0';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appBarTitle)),
      body: BlocBuilder<RandomCatCubit, RandomCatState>(
        builder: (context, state) {
          if (state is RandomCatInitial) {
            context.read<RandomCatCubit>().fetchRandomCat();
          }
          if (state is RandomCatError) {
            return Center(
              child: Image.asset('assets/placeholder_cat.jpeg'),
            );
          } else if (state is RandomCatSuccess) {
            return Center(
              child: Image.network(
                '${ApiRandomCatRepository.catHost}${state.randomCat.url}',
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

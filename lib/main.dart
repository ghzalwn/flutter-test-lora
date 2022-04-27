import 'package:asklora_flutter_test/src/bloc/crypto/crypto_cubit.dart';
import 'package:asklora_flutter_test/src/bloc/favorite/favorite_cubit.dart';
import 'package:asklora_flutter_test/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;

  const MyApp({Key? key, this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CryptoCubit>(
          create: (context) => CryptoCubit([], ''),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit([]),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Tes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter?.onGenerateRoute,
      ),
    );
  }
}

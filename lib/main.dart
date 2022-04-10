import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'router/go_router_cubit.dart';
import 'simple_bloc_observer.dart';

void main() {
  return BlocOverrides.runZoned(
    () async {
      runApp(
        BlocProvider(
          create: (_) => GoRouterCubit(),
          child: const MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => "Nested Routes Navigation Bar",
      routerDelegate: context.read<GoRouterCubit>().state.routerDelegate,
      routeInformationParser: context.read<GoRouterCubit>().state.routeInformationParser,
    );
  }
}

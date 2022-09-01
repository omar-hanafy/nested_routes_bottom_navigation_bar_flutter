import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/app_router_cubit.dart';
import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (_) => AppRouterCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => "Nested Routes Navigation Bar",
      routerDelegate: context.read<AppRouterCubit>().state.routerDelegate,
      routeInformationParser: context.read<AppRouterCubit>().state.routeInformationParser,
      routeInformationProvider: context.read<AppRouterCubit>().state.routeInformationProvider,
    );
  }
}

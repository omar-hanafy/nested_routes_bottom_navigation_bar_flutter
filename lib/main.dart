import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NavigationIndexCubit>(create: (context) => NavigationIndexCubit()),
        BlocProvider<NavigationControllerCubit>(create: (context) => NavigationControllerCubit()),
        BlocProvider(create: (_) => AppRouterCubit()),
        BlocProvider(create: (_) => InternetConnectionBloc()..add(CheckConnection())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

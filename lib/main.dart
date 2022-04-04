import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'router/router.dart';
import 'simple_bloc_observer.dart';

void main() {
  return BlocOverrides.runZoned(
    () async {
      runApp(
        BlocProvider(
          create: (_) => DelegateCubit(),
          child: const MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<DelegateCubit>().state.pushPage(name: '/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => "SaniTary",
      routerDelegate: context.read<DelegateCubit>().state,
      routeInformationParser: const MyRouteInformationParser(),
    );
  }
}

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../explore/explore.dart';
import '../../../home/home.dart';
import '../../app.dart';

_pageBuilder(BuildContext context, GoRouterState state, {required Widget child}) {
  return foundation.kIsWeb
      ? NoTransitionPage<void>(
          key: state.pageKey,
          child: WebNavigationBar(
            child: child,
          ),
        )
      : MaterialPage<void>(key: state.pageKey, child: child);
}

List<GoRoute> subRoutes = [];

class AppRouterCubit extends Cubit<GoRouter> {
  AppRouterCubit()
      : super(
          GoRouterInitial(
            routes: [
              GoRoute(
                routes: subRoutes,
                path: '/',
                name: RoutesPaths.home,
                pageBuilder: (context, state) => _pageBuilder(
                  context,
                  state,
                  child: foundation.kIsWeb ? const HomeView() : MobileTabletNavigationBar(),
                ),
              ),
            ],
          ),
        );

  void push(String location) => state.push(location);
}

class GoRouterInitial extends GoRouter {
  GoRouterInitial({required List<GoRoute> routes})
      : super(
            routes: routes,
            errorBuilder: (BuildContext context, GoRouterState state) => ErrorPage(state: state),
            navigatorBuilder: (
              BuildContext context,
              GoRouterState state,
              Widget child,
            ) =>
                MyAppBuilder(child: child));
}

class MyAppBuilder extends StatelessWidget {
  final Widget child;

  const MyAppBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final repositoryProviders = <RepositoryProvider>[];
    final blocProviders = <BlocProvider>[
      BlocProvider<ExploreBloc>(create: (_) => ExploreBloc()),
    ];

    return MultiBlocProvider(providers: blocProviders, child: child);
  }
}

class ErrorPage extends StatelessWidget {
  final GoRouterState state;

  const ErrorPage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: Center(child: Text('${state.error}')),
    );
  }
}

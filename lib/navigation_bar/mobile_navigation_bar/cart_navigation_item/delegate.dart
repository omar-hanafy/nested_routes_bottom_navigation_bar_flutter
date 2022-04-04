import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screens/ui.dart';
import '../../../router/router.dart';

class CartDelegateCubit extends Cubit<CartRouterDelegate> {
  CartDelegateCubit() : super(CartRouterDelegate());
}

class CartRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final _pages = <Page>[];

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: List.of(_pages),
        onPopPage: _onPopPage,
        transitionDelegate: const MyTransitionDelegate());
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }

    return _confirmAppExit();
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    _setPath(configuration.map((routeSettings) => _createPage(routeSettings)).toList());
    return Future.value(null);
  }

  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath([const RouteSettings(name: '/')]);
    } else {
      setNewRoutePath(uri.pathSegments
          .map((pathSegment) => RouteSettings(
                name: '/$pathSegment',
                arguments:
                    pathSegment == uri.pathSegments.last ? uri.queryParameters : null,
              ))
          .toList());
    }
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;

    popRoute();
    return true;
  }

  void _setPath(List<Page> pages) {
    _pages.clear();
    _pages.addAll(pages);

    if (_pages.first.name != '/') {
      _pages.insert(0, _createPage(const RouteSettings(name: '/')));
    }
    notifyListeners();
  }

  void pushPage({required String? name, Map<String, String>? arguments}) {
    if (name == "/") {
      _pages.clear();
      _pages.insert(0, _createPage(const RouteSettings(name: '/')));
    } else {
      _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    }
    notifyListeners();
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;
    switch (routeSettings.name) {
      case '/':
        child = const CartScreen();
        break;
      case '/account':
        child = const AccountScreen();
        break;
      default:
        child = Scaffold(
          appBar: AppBar(title: const Text('404')),
          body: const Center(child: Text('Page not found')),
        );
    }

    return MaterialPage(
      key: Key(routeSettings.toString()) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
      child: child,
    );
  }

  Future<bool> _confirmAppExit() async {
    return true;
  }
}

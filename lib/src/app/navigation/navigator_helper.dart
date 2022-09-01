import 'package:flutter/foundation.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:go_router/go_router.dart';import 'navigation.dart';/// navigation helper class responsible for navigating between pages with specific delegate/// to minimal boilerplate codeclass NavigatorHelper {  final BuildContext _context;  NavigatorHelper(this._context);  GoRouter getState() {    if (kIsWeb) {      return _context.read<AppRouterCubit>().state;    } else {      /// navigationBarIndex is the Current Index OF The BottomNavigationBar.      /// We use the Router attached to the current selected Index of BottomNavigationBar      /// e.g in Cart item we should use the Cart Router;      final navigationBarIndex = _context.read<NavigationIndexCubit>().state;      debugPrint("current navigationBarIndex is $navigationBarIndex");      switch (navigationBarIndex) {        case (0):          return _context.read<HomeRouterCubit>().state;        case (1):          return _context.read<ExploreRouterCubit>().state;        case (2):          return _context.read<CartRouterCubit>().state;        case (3):          return _context.read<OrdersRouterCubit>().state;        case (4):          return _context.read<AccountRouterCubit>().state;        default:          return _context.read<AppRouterCubit>().state;      }    }  }  void pushNamed({required String name, Map<String, String> queryParams = const {}}) {    if (kIsWeb) {      _context.read<AppRouterCubit>().state.goNamed(name, queryParams: queryParams);    } else {      final pageController = _context.read<NavigationControllerCubit>().state;      switch (name) {        case "home":          pageController.jumpToPage(0);          break;        case "explore":          pageController.jumpToPage(1);          break;        case "cart":          pageController.jumpToPage(2);          break;        case "orders":          pageController.jumpToPage(3);          break;        case "account":          pageController.jumpToPage(4);          break;        default:          getState().pushNamed(name, queryParams: queryParams);      }    }  }  void pushReplacement({String name = "home", Map<String, String> queryParams = const {}}) {}}
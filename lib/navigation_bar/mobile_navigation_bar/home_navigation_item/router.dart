import 'package:flutter/material.dart';import 'package:flutter/foundation.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:go_router/go_router.dart';import 'package:nested_routes_bottom_navigation_bar_flutter/navigation_bar/navigation_bar.dart';import '../../../router/go_router_cubit.dart';import '../../../screens/ui.dart';class HomeRouterCubit extends Cubit<GoRouter> {  HomeRouterCubit()      : super(          GoRouter(            routes: [              GoRoute(path: '/', builder: (context, state) => const HomeScreen()),              GoRoute(                path: '/account',                builder: (context, state) => const AccountScreen(),              ),            ],          ),        );}
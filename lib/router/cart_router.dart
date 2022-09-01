import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_router_cubit.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';


class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: context.read<CartRouterCubit>().state.routerDelegate,
      routeInformationProvider: context.read<CartRouterCubit>().state.routeInformationProvider,
      routeInformationParser: context.read<CartRouterCubit>().state.routeInformationParser,
    );
  }
}

List<GoRoute> _subRoutes = [
  GoRoute(
    path: 'account',
    builder: (context, state) => const AccountScreen(),
  ),
];

class CartRouterCubit extends Cubit<GoRouter> {
  CartRouterCubit()
      : super(
          AppRouterInitial(
            routes: [
              GoRoute(routes: _subRoutes, path: '/', builder: (context, state) => const CartScreen()),
            ],
          ),
        );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delegate.dart';
export 'delegate.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    context.read<CartDelegateCubit>().state.pushPage(name: '/');
    // if (!kIsWeb) initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: context.read<CartDelegateCubit>().state,
    );
  }
}

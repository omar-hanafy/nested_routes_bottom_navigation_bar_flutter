import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../navigation_bar/navigation_bar.dart';
import '../router/router.dart';
import '../router/go_router_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: const Text("Category Screen"),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (kIsWeb) {
                  context.go("${context.read<GoRouterCubit>().state.location}/account");
                } else {
                  context.read<CategoryRouterCubit>().state.push('/account');
                }
              },
              child: const Text(
                "Go to Account Screen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "This is the Category Screen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

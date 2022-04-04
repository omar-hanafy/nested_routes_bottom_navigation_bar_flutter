import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../navigation_bar/navigation_bar.dart';
import '../router/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: const Text("Home Screen"),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (kIsWeb) {
                  context.read<DelegateCubit>().state.pushPage(name: "/account");
                } else {
                  context.read<HomeDelegateCubit>().state.pushPage(name: '/account');
                }
              },
              child: const Text(
                "Go to Account Screen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "This is the Home Screen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

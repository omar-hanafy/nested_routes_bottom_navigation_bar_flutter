import 'package:flutter/foundation.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import '../../navigation_bar/navigation_bar.dart';class AccountScreen extends StatelessWidget {  const AccountScreen({Key? key}) : super(key: key);  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: kIsWeb          ? null          : AppBar(              title: const Text("Account Screen"),            ),      body: Center(        child: ElevatedButton(          onPressed: () {},          child: const Text(            "This is the Account Screen",            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),          ),        ),      ),    );  }}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class NavigationIndexCubit extends Cubit<int> {
  NavigationIndexCubit() : super(0);

  void changePage(int index) => emit(index);

  void changePageByName() {}
}

class NavigationControllerCubit extends Cubit<PageController> {
  NavigationControllerCubit() : super(PageController());
}

class MobileTabletNavigationBar extends StatelessWidget {
  MobileTabletNavigationBar({Key? key}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeRouterCubit()),
        BlocProvider(create: (context) => ExploreRouterCubit()),
        BlocProvider(create: (context) => CartRouterCubit()),
        BlocProvider(create: (context) => OrdersRouterCubit()),
        BlocProvider(create: (context) => AccountRouterCubit()),
      ],
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: context.read<NavigationControllerCubit>().state,
          onPageChanged: (int index) => context.read<NavigationIndexCubit>().changePage(index),
          children: const <Widget>[
            HomeNavBarItemRouter(),
            ExploreNavBarItemRouter(),
            CartNavBarItemRouter(),
            OrdersNavBarItemRouter(),
            AccountNavBarItemRouter(),
          ],
        ),
        bottomNavigationBar: BlocBuilder<NavigationIndexCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  backgroundColor: Colors.amberAccent,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: "Explore",
                  backgroundColor: Colors.amberAccent,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                  backgroundColor: Colors.amberAccent,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: "Cart",
                  backgroundColor: Colors.amberAccent,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label: "Account",
                  backgroundColor: Colors.amberAccent,
                ),
              ],
              currentIndex: selectedIndex,
              onTap: (int index) {
                if (index == selectedIndex) {
                } else {
                  context.read<NavigationControllerCubit>().state.jumpToPage(index);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

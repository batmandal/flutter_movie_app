import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/providers/common.dart';
import 'package:flutter_movie/screens/movies.dart';
import 'package:flutter_movie/screens/profile.dart';
import 'package:flutter_movie/screens/wish_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _totalPage = [
    const MoviesPage(),
    const WishListPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xff36393f),
          body: SafeArea(
            child: _totalPage[provider.currentIdx],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIdx,
            onTap: provider.changeCurrentIdx,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.movie),
                label: "movie".tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: "favorite".tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: "profile".tr(),
              ),
            ],
          ),
        );
      }),
    );
  }
}

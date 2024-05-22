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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: "Кино",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Дуртай",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Профайл",
              ),
            ],
          ),
        );
      }),
    );
  }
}

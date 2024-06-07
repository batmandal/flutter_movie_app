import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/global_keys.dart';
import 'package:flutter_movie/providers/common.dart';
import 'package:flutter_movie/screens/login.dart';
import 'package:flutter_movie/services/api/index.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;
    if (context.locale.languageCode == const Locale('mn', 'MN').languageCode) {
      context.setLocale(const Locale('en', 'US'));
    } else {
      context.setLocale(const Locale('mn', 'MN'));
    }
  }

  void _onHttpRequest() async {
    final api = ApiService();
    final data = await api.getRequest("packages/dio");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return provider.isLoggedIn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _onHttpRequest,
                      child: const Text("send request")),
                  ElevatedButton(
                    onPressed: _onChangeLanguage,
                    child: Text(context.locale.languageCode),
                  ),
                  ElevatedButton(
                    onPressed: provider.onLogout,
                    child: const Text("Гарах"),
                  ),
                ],
              ),
            )
          : LoginPage();
    }));
  }
}

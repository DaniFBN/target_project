// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/shared/services/local_storage/shared_preferences_local_storage_service.dart';
import 'core/shared/services/url_launch/url_launch_service.dart';
import 'core/shared/themes/app_theme.dart';
import 'pages/home/home_page.dart';
import 'pages/home/stores/home_store.dart';
import 'pages/login_page.dart';

class AppWidget extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const AppWidget({
    super.key,
    required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(urlLaunchService: UrlLaunchService()),
        '/home': (_) {
          return HomePage(
            homeStore: HomeStore(
              SharedPreferencesLocalStorageService(sharedPreferences),
            ),
          );
        },
      },
    );
  }
}

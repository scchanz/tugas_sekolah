import 'package:auth/Views/detail_recipe.dart';
import 'package:auth/Views/home_page.dart';
import 'package:auth/Views/profile_page.dart';
import 'package:auth/Views/logout_page.dart';
import 'package:auth/Views/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String logout = '/logout';
  static const String login = '/login';
  static const String recipeDetail = '/recipeDetail'; // ✅ Tambah ini

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case logout:
        return MaterialPageRoute(builder: (_) => const LogoutView());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case recipeDetail:
        return MaterialPageRoute(
          builder: (_) => const RecipeDetailView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}

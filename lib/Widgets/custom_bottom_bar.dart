import 'package:auth/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:auth/Views/home_page.dart';
import 'package:auth/Views/profile_page.dart';
import 'package:auth/Views/logout_page.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index != currentIndex) {
      _navigateWithoutAnimation(context, _getRouteByIndex(index));
    }
  }

  void _navigateWithoutAnimation(BuildContext context, String routeName) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation1, animation2) => _getPageByRoute(routeName),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  Widget _getPageByRoute(String routeName) {
    switch (routeName) {
      case AppRoutes.home:
        return const HomeView();
      case AppRoutes.profile:
        return const ProfileView();
      case AppRoutes.logout:
        return const LogoutView();
      default:
        return const HomeView(); // Fallback to HomeView
    }
  }

  String _getRouteByIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.home;
      case 1:
        return AppRoutes.profile;
      case 2:
        return AppRoutes.logout;
      default:
        return AppRoutes.home; // Fallback to Home route
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 28,
            color: currentIndex == 0 ? Colors.blueAccent : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 28,
            color: currentIndex == 1 ? Colors.blueAccent : Colors.grey,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.logout,
            size: 28,
            color: currentIndex == 2 ? Colors.blueAccent : Colors.grey,
          ),
          label: 'Logout',
        ),
      ],
    );
  }
}

// Alternative Method 2: Configure in your route definitions
// Add this to your MaterialApp or wherever you define routes:
/*
class NoAnimationRoute<T> extends MaterialPageRoute<T> {
  NoAnimationRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child; // No animation, just return the child
  }
}

// Then in your route generation:
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return NoAnimationRoute(builder: (_) => HomePage());
    case AppRoutes.profile:
      return NoAnimationRoute(builder: (_) => ProfilePage());
    case AppRoutes.logout:
      return NoAnimationRoute(builder: (_) => LogoutPage());
    default:
      return NoAnimationRoute(builder: (_) => HomePage());
  }
}
*/

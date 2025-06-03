import 'package:auth/Widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout', textAlign: TextAlign.center),
        automaticallyImplyLeading: false, // Disable the back button
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(currentIndex: 2),
    );
  }
}

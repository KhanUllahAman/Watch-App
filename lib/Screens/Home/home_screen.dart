// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:insomnia_app/Screens/Welcome/welcome_screen.dart';
import 'package:insomnia_app/Services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Logout"),
            IconButton(
              onPressed: () async {
                await authService.signOut();
                Navigator.pushReplacementNamed(
                  context,
                  WelcomeScreen.routeName,
                );
              },
              icon: const Icon(
                Icons.logout,
              ),
            )
          ],
        ),
      ),
    );
  }
}

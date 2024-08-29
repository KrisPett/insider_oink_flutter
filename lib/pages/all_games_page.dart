import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class AllGamesPage extends StatelessWidget {
  const AllGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Go to Home Page'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}

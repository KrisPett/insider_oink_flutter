import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setup-game');
                },
                child: const Text('Create Game'),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}

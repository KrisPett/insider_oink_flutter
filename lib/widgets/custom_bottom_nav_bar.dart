import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Home', style: TextStyle(fontSize: 16)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/all-games');
            },
            child: const Text('All Games', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

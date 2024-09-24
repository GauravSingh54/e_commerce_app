import 'package:flutter/material.dart';
import 'package:e_commerce_app/login/login.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          icon: Image.asset(
            "images/icon.png",
            height: 20,
          ),
        ),
        Row(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: kcontentColor,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.notifications_outlined),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: kcontentColor,
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ],
    );
  }
}

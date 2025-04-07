import 'package:flutter/material.dart';
import 'package:hyde_stylehub/core/routing/routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to HyDE Style Hub',

            ),
            const SizedBox(height: 16),
            Text(
              'HyDE Style Hub is a theme gallery for Flutter apps. You can browse and download themes for your app here.',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.mainPage);
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash_screen/auth/login_screen.dart';
import 'package:splash_screen/const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0054A5), Color(0xFF00152A)],
            transform: GradientRotation(134.21 * 3.1416 / 180),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 2);
                },
                children: [
                  buildOnboardPage(
                    image: '${imagePath}worker1.svg',
                    title: 'Welcome to FixIt',
                    subtitle:
                        'Discover a world of convenience and reliability. FixIt is your one stop solution for all your home service needs.',
                  ),
                  buildOnboardPage(
                    image: '${imagePath}worker2.svg',
                    title: 'Find Services',
                    subtitle:
                        'Browse and book a wide range of services from plumbing and electrical to appliance repair. We’ve got it all covered.',
                  ),
                  buildOnboardPage(
                    image: '${imagePath}worker3.svg',
                    title: 'Fast & Reliable',
                    subtitle:
                        'Our professionals ensure quick and reliable service every time. Sit back and relax, we’ve got you covered.',
                  ),
                ],
              ),

              // Skip
              Positioned(
                top: 16,
                right: 16,
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              // Page indicator
              Positioned(
                top: 24,
                left: 16,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 6,
                  ),
                ),
              ),

              // Next button
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (isLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      isLastPage ? 'Get Started' : 'Next',
                      style: const TextStyle(
                        color: Color(0xFF0054A5),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOnboardPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image, height: 260),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

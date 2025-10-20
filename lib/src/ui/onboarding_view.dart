import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/ui/nav_view.dart';
import 'package:global66/src/widgets/image_with_description.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);

    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => NavView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingPage(
        title: FlutterI18n.translate(context, "onboarding.page1_title"),
        description: FlutterI18n.translate(
          context,
          "onboarding.page1_description",
        ),
        image: Image.asset(
          'assets/images/onboarding/onboarding1.png',
          scale: 1,
        ),
        color: Colors.red,
      ),
      OnboardingPage(
        title: FlutterI18n.translate(context, "onboarding.page2_title"),
        description: FlutterI18n.translate(
          context,
          "onboarding.page2_description",
        ),
        image: Image.asset(
          'assets/images/onboarding/onboarding2.png',
          scale: 1,
        ),
        color: Colors.pink,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(pages[index]);
                },
              ),
            ),

            // Page indicator
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: kBlueIndicator,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),

            // Next/Get Started button
            Padding(
              padding: EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == pages.length - 1) {
                      _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueButton,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    _currentPage == pages.length - 1
                        ? FlutterI18n.translate(
                          context,
                          "onboarding.get_started",
                        )
                        : FlutterI18n.translate(context, "onboarding.next"),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return ImageWithDescription(
      context: context,
      image: page.image,
      title: page.title,
      description: page.description,
      topRatio: 0.20,
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final Image image;
  final Color color;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

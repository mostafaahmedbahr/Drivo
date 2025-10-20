import 'dart:math';
import 'package:drivo/features/splash/presentation/screens/splash_screen_2.dart';

import '../../../../core/utils/app_images/png_images.dart';
import '../../../../main_importants.dart';

class  SplashScreen extends StatefulWidget {
  const  SplashScreen({super.key});

  @override
  State< SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State< SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          AppNav.customNavigator(
            context: context,
            screen: const SplashScreen2(),
          );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Center(
                child: Image.asset(PngImages.logo, width: 200),
              ),
            ),
          );
        },
      ),
    );
  }
}
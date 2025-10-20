import 'dart:async';
import 'package:drivo/core/utils/app_images/png_images.dart';
import 'package:drivo/features/login/presentation/screens/login_screen.dart';
import 'package:drivo/main_importants.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // تأخير لمدة 3 ثواني ثم الانتقال للشاشة التالية
    Future.delayed(const Duration(seconds: 2), () {
      if(mounted){
        AppNav.customNavigator(context: context, screen: LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          PngImages.splash,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'dart:async';
 import 'package:drivo/main_importants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if(mounted){
        context.pushNamed(Routes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              PngImages.splash,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height*0.30,
              left: 40,
              right: 40,
              child: Image.asset(PngImages.logo)),
        ],
      ),
    );
  }
}

import '../../../../main_importants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.pushNamed(Routes.splashScreen2);
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
    debugPrint(CacheTokenManger.userToken);
    debugPrint("SplashScreen");
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition(
          scale: _animation,
          child: Center(child: Image.asset(PngImages.logo,width: 200,)),
        ),
      ),
    );
  }
}

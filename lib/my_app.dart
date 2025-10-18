import 'package:responsive_framework/responsive_framework.dart';
import 'main_importants.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Drivo",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhiteColor,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.offWhiteColor,
        ),
        fontFamily: "Axiforma Regular.otf",
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
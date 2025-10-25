 import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'features/layout/presentation/cubit/layout_cubit.dart';
 import 'main_importants.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.layoutScreen,
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale, // This will update automatically
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.appName.tr(),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.whiteColor,
          ),
          fontFamily: "Cairo",
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
      ),
    );
  }
}
 import 'package:drivo/features/all_cars/presentation/screens/all_cars_screen.dart';
  import 'package:drivo/features/car_details/presentation/cubit/car_details_cubit.dart';
import 'package:drivo/features/car_details/presentation/screens/car_details_screen.dart';
 import 'package:drivo/features/home/presentation/screens/home_screen.dart';
import 'package:drivo/features/layout/presentation/screens/layout_screen.dart';
import 'package:drivo/features/login/presentation/screens/login_screen.dart';
import 'package:drivo/features/register/presentation/screens/register_screen.dart';
import 'package:drivo/features/splash/presentation/screens/splash_screen.dart';
 import '../../../features/booking/presentation/screens/booking_screen.dart';
import '../../../features/car_details/presentation/screens/car_gallery_images_screen.dart';
import '../../../features/contracts/presentation/screens/contracts_screen.dart';
import '../../../features/more/presentation/screens/more_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/splash/presentation/screens/splash_screen_2.dart';
import '../../../main_importants.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.splashScreen2:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen2(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
        );
      case Routes.carImagesGalleryScreen:
        final args = arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CarGalleryImagesScreen(
            carImages: args['carImages'] as List<String>,
            initialIndex: args['initialIndex'] as int,
          ),
        );
      case Routes.carDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => CarDetailsCubit(),
              child: const CarDetailsScreen()),
        );
      case Routes.allCarsScreen:
        return MaterialPageRoute(
          builder: (context) => const AllCarsScreen(),
        );
      case Routes.moreScreen:
        return MaterialPageRoute(
          builder: (context) => const MoreScreen(),
        );
      case Routes.contractsScreen:
        return MaterialPageRoute(
          builder: (context) => const ContractsScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.bookingScreen:
        return MaterialPageRoute(
          builder: (context) => const BookingScreen(),
        );
      default:
        return null;
    }
  }
}
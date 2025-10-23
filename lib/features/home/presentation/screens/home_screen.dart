import 'package:drivo/main_importants.dart';

import '../widgets/cars_in_offers.dart';
import '../widgets/choose_your_car.dart';
import '../widgets/profile_name_and_notification_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const ProfileNameAndNotificationIcon(),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ChooseYourCar(),
            CarsInOffers(),
          ],
        ),
      )),
    );
  }
}

import 'package:drivo/main_importants.dart';

import '../widgets/cars_in_offers.dart';
import '../widgets/choose_your_car.dart';
import '../widgets/offer_slider_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ChooseYourCar(),
         OfferSliderImages(),
         //   CarsInOffers(),
          ],
        ),
      )),
    );
  }
}

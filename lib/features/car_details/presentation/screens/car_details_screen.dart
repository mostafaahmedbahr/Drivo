import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/car_features.dart';
import '../widgets/car_slider_images.dart';
import '../widgets/car_name_and_des.dart';
import '../widgets/expert_evaluation.dart';
import '../widgets/price_and_another_info.dart';
import '../widgets/rent_and_reservation_buttons.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.carDetails.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarNameAndDes(),
            verticalSpace(20),
            CarSliderImages(),
            verticalSpace(20),
            CarFeatures(),
            verticalSpace(20),
            ExpertEvaluation(),
            verticalSpace(20),
            PriceAndAnotherInfo(),
            verticalSpace(20),
            Spacer(),
            RentAndReservationButtons(),
            verticalSpace(20),

          ],
        ),
      ),
    );
  }


}

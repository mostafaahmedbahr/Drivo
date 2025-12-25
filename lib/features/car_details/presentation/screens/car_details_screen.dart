import 'package:drivo/features/car_details/presentation/cubit/car_details_cubit.dart';
import 'package:drivo/features/car_details/presentation/cubit/car_details_states.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/car_features.dart';
import '../widgets/car_slider_images.dart';
import '../widgets/car_name_and_des.dart';
import '../widgets/expert_evaluation.dart';
import '../widgets/price_and_another_info.dart';
import '../widgets/rent_and_reservation_buttons.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.carId});
  final int carId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.carDetails.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CarDetailsCubit , CarDetailsStates>(
          builder: (context,state){
            var carDetailsCubit = context.read<CarDetailsCubit>();
            var car = carDetailsCubit.carDetailsModel;
            return Skeletonizer(
              enabled: carDetailsCubit.carDetailsModel==null || state is GetCarDetailsLoadingState,
              child: ListView(
                children: [
                  CarNameAndDes(name: car?.brand??"", des:  car?.model??"", rate:  car?.carLevel??""),
                  verticalSpace(20),
                  CarSliderImages(image: car?.imageUrl??"",),
                  verticalSpace(20),
                  CarFeatures(),
                  verticalSpace(20),
                  ExpertEvaluation(),
                  verticalSpace(20),
                  PriceAndAnotherInfo(),
                  verticalSpace(60),
                  RentAndReservationButtons(),
                  verticalSpace(20),

                ],
              ),
            );
          },

        ),
      ),
    );
  }


}

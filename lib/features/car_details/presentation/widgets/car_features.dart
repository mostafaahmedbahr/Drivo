import 'package:drivo/features/car_details/presentation/cubit/car_details_cubit.dart';
import 'package:drivo/features/car_details/presentation/widgets/car_feature_item.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

class CarFeatures extends StatelessWidget {
  const CarFeatures({super.key});
  @override
  Widget build(BuildContext context) {
    var carDetailsCubit = context.read<CarDetailsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.carFeatures.tr(),
          style: AppStyles.semiBold20Black,
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            carDetailsCubit.featuresList.length,
                (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index < carDetailsCubit.featuresList.length - 1 ? 12 : 0,
                ),
                child: CarFeatureItem(
                  svgImage: carDetailsCubit.featuresList[index].svgImage,
                  value: carDetailsCubit.featuresList[index].value,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


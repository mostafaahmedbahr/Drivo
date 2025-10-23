 import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'car_item.dart';

class CarsInOffers extends StatelessWidget {
  const CarsInOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(LocaleKeys.offers.tr(),style: AppStyles.semiBold18Black,),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CarItem();
          },
        ),
      ],
    );
  }
}
 import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'car_item.dart';

class BestCars extends StatelessWidget {
  const BestCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LocaleKeys.bestCars.tr(),style: AppStyles.semiBold18Black,),
              TextButton(onPressed: (){
                context.pushNamed(Routes.allCarsScreen);
              }, child: Text(LocaleKeys.viewAll.tr(),style: TextStyle(
                color: AppColors.orange
              ),))
            ],
          ),
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
            return const CarItem(fullWidth: false,);
          },
        ),
        verticalSpace(20),
      ],
    );
  }
}
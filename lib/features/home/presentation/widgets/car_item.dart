import 'package:easy_localization/easy_localization.dart';
import '../../../../main_importants.dart';

class CarItem extends StatelessWidget {
  const CarItem({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final double cardRadius = 16;
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.carDetailsScreen);
      },
      child: Card(
        color: AppColors.whiteColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hyundai", style: AppStyles.semiBold14Black),
                  Text("Sonata", style: AppStyles.semiBold14Black),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Image.asset("assets/images/pngs/LEAD-removebg-preview.png",fit: BoxFit.cover,),
            ),
            verticalSpace(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.only(
                      bottomRight:
                      !isArabic ? Radius.zero : Radius.circular(cardRadius),
                      topLeft:
                      !isArabic ? Radius.zero : Radius.circular(cardRadius),
                      bottomLeft:
                      !isArabic ? Radius.circular(cardRadius) : Radius.zero,
                      topRight:
                      !isArabic ? Radius.circular(cardRadius) : Radius.zero,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.reservation.tr(),
                      style: AppStyles.medium12White,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "80 rs/day",
                    style: AppStyles.medium12Black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

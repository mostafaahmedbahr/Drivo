import 'package:drivo/features/car_details/presentation/widgets/select_date_time_reservation.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../main_importants.dart';
import '../cubit/car_details_cubit.dart';
import '../cubit/car_details_states.dart';

class RentAndReservationButtons extends StatelessWidget {
  const RentAndReservationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsCubit, CarDetailsStates>(
      builder: (context, state) {
        final carDetailsCubit = CarDetailsCubit.get(context);

        return Column(
          children: [
            if (carDetailsCubit.selectedDateTime != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: AppColors.orange),
                            horizontalSpace(8),
                            Text(
                              carDetailsCubit.getFormattedDate(),
                              style: AppStyles.medium12Black,
                            ),
                            horizontalSpace(16),
                            Icon(Icons.access_time, size: 16, color: AppColors.orange),
                            horizontalSpace(8),
                            Text(
                              carDetailsCubit.getFormattedTime(context),
                              style: AppStyles.medium12Black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Buttons Row
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    btnText: Text(LocaleKeys.reservation.tr(), style: AppStyles.semiBold16White),
                    onPressed: () {
                      DateTimeBottomSheet.showDateTimeSelection(
                        context: context,
                        onDateTimeSelected: (selectedDateTime) {
                          if (selectedDateTime != null) {

                          }
                        },
                      );
                    },
                  ),
                ),
                horizontalSpace(20),
                Expanded(
                  child: Stack(
                    children: [
                      CustomButton(
                        btnColor: AppColors.whiteColor,
                        btnText: Text(LocaleKeys.rent.tr(), style: AppStyles.semiBold16Black),
                        onPressed: null,
                      ),
                      Positioned(
                        top: 4,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            LocaleKeys.soon.tr(),
                            style: AppStyles.medium12White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
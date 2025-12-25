import 'package:drivo/core/shared_widgets/custom_drop_down.dart';
import 'package:drivo/features/home/presentation/cubit/home_cubit.dart';
import 'package:drivo/features/home/presentation/cubit/home_states.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import '../../data/models/all_branches_by_city_id_model.dart';
import '../../data/models/all_cities_model.dart';

class ChooseYourCar extends StatelessWidget {
  const ChooseYourCar({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ExpansionTileCard(
                baseColor: AppColors.greyColor2,
                expandedColor: AppColors.greyColor2,
                key: cardA,
                title: Text(
                  LocaleKeys.chooseYourCarNow.tr(),
                  style: AppStyles.semiBold18Black,
                ),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                    color: AppColors.whiteColor,
                  ),
                  verticalSpace(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.choosePickupLocation.tr(),
                          style: AppStyles.semiBold18Black,
                        ),
                        verticalSpace(8),
                        Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<HomeCubit, HomeStates>(
                                buildWhen: (previous, current) =>
                                    current is GetAllCitiesLoadingState ||
                                    current is GetAllCitiesSuccessState ||
                                    current is HomeCitySelectedState,
                                builder: (context, state) {
                                  var homeCubit = context.read<HomeCubit>();
                                  if (state is GetAllCitiesLoadingState ||
                                      homeCubit.allCitiesModel == null) {
                                    return CustomLoading(size: 32);
                                  }
                                  return CustomDropdown<Cities>(
                                    value: homeCubit.selectedCity,
                                    items: homeCubit.allCitiesModel?.data ?? [],
                                    hint: LocaleKeys.city.tr(),
                                    itemDisplayBuilder: (item) =>
                                        item.cityNameAr ?? '',
                                    onChanged: (val) {
                                      homeCubit.selectCity(val);
                                      homeCubit.getAllBranchesByCityId(
                                        cityId: homeCubit.selectedCity!.cityId!,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),

                            horizontalSpace(12),
                            if(homeCubit.selectedCity!=null)
                            Expanded(
                              child: BlocBuilder<HomeCubit, HomeStates>(
                                buildWhen: (previous, current) =>
                                    current
                                        is GetAllBranchesByCityIdSuccessState ||
                                    current
                                        is GetAllBranchesByCityIdErrorState ||
                                    current
                                        is GetAllBranchesByCityIdLoadingState ||
                                    current is HomeBranchSelectedState,
                                builder: (context,state){
                                  var homeCubit = context.read<HomeCubit>();
                                  if (state is GetAllBranchesByCityIdLoadingState ||
                                      homeCubit.allBranchesByCityIdModel == null) {
                                    return CustomLoading(size: 32);
                                  }
                                  return

                                    CustomDropdown<Branches>(
                                    value: homeCubit.selectedBranch,
                                    items:
                                    homeCubit
                                        .allBranchesByCityIdModel
                                        ?.data ??
                                        [],
                                    hint: LocaleKeys.city.tr(),
                                    itemDisplayBuilder: (item) =>
                                    item.branchName ?? '',
                                    onChanged: (val) {
                                      homeCubit.selectBranch(val);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(12),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: homeCubit.isChecked,
                        activeColor: AppColors.orange,
                        checkColor: AppColors.whiteColor,
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          Set<WidgetState> states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.orange;
                          }
                          return Colors.transparent;
                        }),
                        side: const BorderSide(
                          color: AppColors.shipGray,
                          width: 2.0,
                        ),
                        onChanged: (bool? value) {
                          homeCubit.changeCheckboxValue(value!);
                        },
                      ),
                      Text(
                        LocaleKeys.deliveryToAnotherLocation.tr(),
                        style: AppStyles.semiBold18Black,
                      ),
                    ],
                  ),
                  if (homeCubit.isChecked)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Expanded(
                              //   child: CustomDropdown<Data>(
                              //     value: homeCubit.selectedCity,
                              //     items: homeCubit.allCitiesModel?.data ?? [],
                              //     hint: LocaleKeys.city.tr(),
                              //
                              //     itemDisplayBuilder: (item) => item.cityNameAr ?? '',
                              //
                              //     onChanged: (val) {
                              //       homeCubit.selectCity(val);
                              //     },
                              //   )
                              //   ,
                              // ),
                              horizontalSpace(12),
                              Expanded(
                                child: CustomDropdown(
                                  value: homeCubit.selectedBranchTo,
                                  items: homeCubit.branches,
                                  onChanged: (val) {
                                    homeCubit.selectBranchTo(val);
                                  },
                                  hint: LocaleKeys.branch.tr(),
                                  itemDisplayBuilder: (item) => item,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(12),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomButton(
                      btnText: Text(
                        LocaleKeys.next.tr(),
                        style: AppStyles.semiBold16White,
                      ),
                      onPressed: () {
                        context.pushNamed(Routes.allCarsScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
